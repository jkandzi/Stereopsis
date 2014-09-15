//
//  JHKImageRotationView.h
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHKViewController.h"

@class JHKImageRotationView;

@protocol JHKImageRotationViewDelegate <NSObject>
- (void)imageRotationViewCompletedRotation:(JHKImageRotationView *)imageRotationView;
@end

@interface JHKImageRotationView : UIView
@property (nonatomic, weak) id <JHKImageRotationViewDelegate> delegate;
- (void)displayImage:(UIImage *)image;
- (void)displayImage:(UIImage *)image direction:(JHKImageSwitchDirection)direction;

@end
