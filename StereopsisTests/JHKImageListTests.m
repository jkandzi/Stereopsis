//
//  JHKImageListTests.m
//  Stereopsis
//
//  Created by Justus Kandzi on 15/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

#import "JHKImageList.h"
#import "JHKStereoImage.h"

SpecBegin(ImageList)

describe(@"Image List", ^{
    
    __block JHKImageList *imageList;
    __block JHKStereoImage *image0;
    __block JHKStereoImage *image1;
    
    beforeAll(^{
        imageList = [JHKImageList new];
    });
    
    it(@"should have current image", ^{
        image0 = [imageList currentImage];
        expect(image0).toNot.beNil();
    });
    
    it(@"should have next image", ^{
        image1 = [imageList nextImage];
        expect(image1).toNot.beNil();
    });
    
    it(@"s previous image should be image 0", ^{
        JHKStereoImage *previousImage = [imageList previousImage];
        expect(previousImage).to.equal(image0);
    });
    
});

SpecEnd