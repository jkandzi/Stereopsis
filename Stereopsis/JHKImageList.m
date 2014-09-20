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
@end

@implementation JHKImageList

- (instancetype)initWithContentsOfFile:(NSString *)path {
    self = [super init];
    if (self) {
        NSArray *imageSources = [[NSArray alloc] initWithContentsOfFile:path];
        NSMutableArray *mutableImages = [NSMutableArray new];
        
        for (NSDictionary *imageDictionary in imageSources) {
            NSString *prefix = [imageDictionary objectForKey:@"name"];
            BOOL animated = [[imageDictionary objectForKey:@"animated"] boolValue];
            JHKStereoImage *image = [[JHKStereoImage alloc] initWithImagePrefix:prefix animated:animated];
            [mutableImages addObject:image];
        }
        
        _images = [mutableImages copy];
        _currentImageID = 0;
    }
    return self;
}

- (JHKStereoImage *)nextImage {
    self.currentImageID = (self.currentImageID + 1) % self.images.count;
    return self.currentImage;
}

- (JHKStereoImage *)previousImage {
    self.currentImageID = (self.images.count + (self.currentImageID - 1)) % self.images.count;
    return self.currentImage;
}

- (JHKStereoImage *)currentImage {
    return self.images[self.currentImageID];
}

@end
