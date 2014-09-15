//
//  JHKImageList.h
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JHKStereoImage;

@interface JHKImageList : NSObject

- (JHKStereoImage *)currentImage;
- (JHKStereoImage *)nextImage;
- (JHKStereoImage *)previousImage;

@end
