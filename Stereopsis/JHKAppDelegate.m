//
//  JHKAppDelegate.m
//  Stereopsis
//
//  Created by Justus Kandzi on 15/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKAppDelegate.h"

@implementation JHKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    return YES;
}

@end
