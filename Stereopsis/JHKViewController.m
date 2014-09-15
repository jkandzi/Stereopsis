//
//  JHKViewController.m
//  Stereopsis
//
//  Created by Justus Kandzi on 15/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKViewController.h"
#import "JHKImageList.h"
#import "JHKStereoImage.h"
#import "JHKImageRotationView.h"
#import "JHKAccelerometerActionRecognizer.h"

@interface JHKViewController () <JHKImageRotationViewDelegate>
@property (nonatomic, strong) JHKImageList *imageList;
@property (weak, nonatomic) IBOutlet JHKImageRotationView *leftImageRotationView;
@property (weak, nonatomic) IBOutlet JHKImageRotationView *rightImageRotationView;

@property (nonatomic, strong) JHKAccelerometerActionRecognizer *accelerometerActionRecognizer;

@property (nonatomic, getter = areRotationViewsAnimating) BOOL rotationViewsAnimating;
@property (nonatomic, getter = isDismissingViewController) BOOL dismissingViewController;
@end

@implementation JHKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageList = [JHKImageList new];
    self.leftImageRotationView.delegate = self;
    
    JHKStereoImage *stereoImage = [self.imageList currentImage];
    [self.leftImageRotationView displayImage:stereoImage.leftImage];
    [self.rightImageRotationView displayImage:stereoImage.rightImage];
    
    self.accelerometerActionRecognizer = [[JHKAccelerometerActionRecognizer alloc] initWithTarget:self action:@selector(switchImageInDirection:)];
    
    self.dismissingViewController = NO;
}


- (IBAction)didSwipeUp {
    [self switchImageInDirection:JHKImageSwitchDirectionUp];
}

- (IBAction)didSwipeDown {
    [self switchImageInDirection:JHKImageSwitchDirectionDown];
    
}


- (void)switchImageInDirection:(JHKImageSwitchDirection)direction {
    if (!self.areRotationViewsAnimating) {
        self.rotationViewsAnimating = YES;
        
        JHKStereoImage *stereoImage;
        if (direction == JHKImageSwitchDirectionDown) {
            stereoImage = [self.imageList nextImage];
        } else  {
            stereoImage = [self.imageList previousImage];
        }
        
        [self.leftImageRotationView displayImage:stereoImage.leftImage direction:direction];
        [self.rightImageRotationView displayImage:stereoImage.rightImage direction:direction];
    }
}

- (IBAction)dismissStereopsisView {
    if (!self.isDismissingViewController) {
        self.dismissingViewController = YES;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imageRotationViewCompletedRotation:(JHKImageRotationView *)imageRotationView {
    self.rotationViewsAnimating = NO;
}

@end
