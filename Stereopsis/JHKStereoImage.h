//
//  JHKStereoImage.h
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHKStereoImage : NSObject
@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, strong) UIImage *rightImage;

- (instancetype)initWithImagePrefix:(NSString *)prefix animated:(BOOL)animated;
@end
