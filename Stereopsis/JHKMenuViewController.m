//
//  JHKMenuViewController.m
//  Stereopsis
//
//  Created by Justus Kandzi on 12/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKMenuViewController.h"
#import "JHKViewController.h"

@interface JHKMenuViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoPosition;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonPosition;
@property (weak, nonatomic) IBOutlet UITextView *aboutView;

@property (nonatomic, getter = isAboutViewVisible) BOOL aboutViewVisible;

@property (nonatomic) unsigned int currentImageID;
@end

@implementation JHKMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.aboutView.layer.borderWidth = 3;
    self.aboutView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.aboutView.text = @"A collection of 3D stereo images by Bill Domonkos that combine altered, archive stereograms and 3D computer graphics. You can view these images in 3D by using Google Cardboard in combination with this app.\ncardboard.withgoogle.com\n\nBill Domonkos is an artist and experimental filmmaker. His work has been shown internationally in cinemas, film festivals, galleries and museums. For more information visit:\nwww.bdom.com";
    self.aboutView.tintColor = [UIColor whiteColor];
}

- (IBAction)toggleAboutView:(id)sender {
    float newAlpha, newLogoPosition, newButtonPosition;
    
    if (self.aboutViewVisible) {
        newButtonPosition = -91;
        newLogoPosition = -102;
        newAlpha = 0.f;
    } else {
        newButtonPosition = -6;
        newLogoPosition = -6;
        newAlpha = 1.f;
    }
    
    [UIView animateWithDuration:0.50
                     animations:^{
                         self.logoPosition.constant = newLogoPosition;
                         self.buttonPosition.constant = newButtonPosition;
                         [self.view layoutIfNeeded];
                         self.aboutView.alpha = newAlpha;
                     }];
    self.aboutViewVisible = !self.isAboutViewVisible;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[JHKViewController class]]) {
        ((JHKViewController *)segue.destinationViewController).currentImageID = self.currentImageID;
    }
}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)segue {
    if ([segue.sourceViewController isKindOfClass:[JHKViewController class]]) {
        self.currentImageID = ((JHKViewController *)segue.sourceViewController).currentImageID;
    }
}

@end
