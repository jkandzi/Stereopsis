//
//  JHKImageRotationView.m
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKImageRotationView.h"
#import <YLGIFImage/YLImageView.h>

static const float JHKImageRotationViewDistance = -1400.f;
static const float JHKImageRotationViewRadians = 0.30f;

@interface JHKImageRotationView ()
@property (nonatomic, strong) YLImageView *visibleImageView;
@end

@implementation JHKImageRotationView

- (YLImageView *)addImageViewWithImage:(UIImage *)image {
    YLImageView *imageView = [[YLImageView alloc] initWithFrame:self.bounds];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:imageView];
    return imageView;
}

- (void)displayImage:(UIImage *)image {
    assert(image);
    self.visibleImageView = [self addImageViewWithImage:image];
}

- (void)displayImage:(UIImage *)image direction:(JHKImageSwitchDirection)direction {
    assert(image);
    
    YLImageView *newImageView = [self addImageViewWithImage:image];
    
    float a;
    if (direction == JHKImageSwitchDirectionUp) {
        a = -JHKImageRotationViewRadians;
    } else {
        a = JHKImageRotationViewRadians;
    }
    
    [newImageView setTransform:[self transformationWithRadians:-a]];
    
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5f animations:^{
        [self.visibleImageView setTransform:[self transformationWithRadians:a]];
        [newImageView setTransform:CGAffineTransformIdentity];
    } completion:^(BOOL finished) {
        [weakSelf.delegate imageRotationViewCompletedRotation:weakSelf];
        [self.visibleImageView removeFromSuperview];
        self.visibleImageView = newImageView;
    }];
}

- (CGAffineTransform)transformationWithRadians:(float)radians {
    float y = self.frame.size.width / 2;
    return CGAffineTransformMake(cos(radians),
                                 sin(radians),
                                 -sin(radians),
                                 cos(radians),
                                 JHKImageRotationViewDistance - JHKImageRotationViewDistance * cos(radians) + y * sin(radians),
                                 y - JHKImageRotationViewDistance * sin(radians) - y * cos(radians));
}

@end
