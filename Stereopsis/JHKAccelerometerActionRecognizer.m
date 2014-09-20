//
//  JHKAccelerometerActionRecognizer.m
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKAccelerometerActionRecognizer.h"
@import CoreMotion;

@interface JHKAccelerometerActionRecognizer ()
@property (nonatomic) CMMotionManager *motionManager;
@property (nonatomic) SEL action;
@property (nonatomic, weak) id target;
@end

@implementation JHKAccelerometerActionRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    self = [super init];
    if (self) {
        _target = target;
        _action = action;

        _motionManager = [CMMotionManager new];
        
        if (_motionManager.isAccelerometerAvailable) {
            NSOperationQueue *queue = [NSOperationQueue mainQueue];
            [_motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {

                static float oldX = 0, alpha = 0.1;
                static BOOL triggered = YES;
                
                float x = accelerometerData.acceleration.x;
                x = oldX + alpha * (x - oldX);
                oldX = x;
                
                NSLog(@"%f", x);
                
                if (x < 0.9f) {
                    if (!triggered) {
                        IMP imp = [target methodForSelector:action];
                        void (*func)(id, SEL) = (void *)imp;
                        func(target, action);
                        
                        triggered = YES;
                    }
                } else  if (x > 0.93f) {
                    triggered = NO;
                }
            }];
        }
    }
    return self;
}

- (void)stop {
    [self.motionManager stopAccelerometerUpdates];
}

@end
