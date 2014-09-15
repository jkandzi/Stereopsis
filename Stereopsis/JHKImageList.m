//
//  JHKImageList.m
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKImageList.h"
#import "JHKStereoImage.h"

@interface JHKImageList ()
@property (nonatomic, strong) NSArray *images;
@property (nonatomic) unsigned long currentImageId;
@end

@implementation JHKImageList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _images = @[[[JHKStereoImage alloc] initWithImagePrefix:@"1" type:JHKStereoImageTypeStill],
                    [[JHKStereoImage alloc] initWithImagePrefix:@"2" type:JHKStereoImageTypeStill],
                    [[JHKStereoImage alloc] initWithImagePrefix:@"3" type:JHKStereoImageTypeAnimated],
                    [[JHKStereoImage alloc] initWithImagePrefix:@"4" type:JHKStereoImageTypeAnimated]];
        _currentImageId = 0;
    }
    return self;
}

- (JHKStereoImage *)nextImage {
    self.currentImageId = (self.currentImageId + 1) % self.images.count;
    return self.currentImage;
}

- (JHKStereoImage *)previousImage {
    self.currentImageId = (self.images.count + (self.currentImageId - 1)) % self.images.count;
    return self.currentImage;
}

- (JHKStereoImage *)currentImage {
    return self.images[self.currentImageId];
}
@end
