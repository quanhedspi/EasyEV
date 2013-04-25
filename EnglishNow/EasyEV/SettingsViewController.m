//
//  SettingsViewController.m
//  EasyEV
//
//
//  Created by Dinh Quan  on 3/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize settingsViewController;
- (void)loadView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f)];
    view.backgroundColor = [UIColor whiteColor];
    
    self.view = view;
    
}
- (void)viewDidLoad {
    
    self.navigationItem.title = @"Settings";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Logout"
                                              style:UIBarButtonItemStyleBordered
                                              target:self
                                              action:@selector(settingsButtonWasPressed:)];
    
}


-(IBAction)settingsButtonWasPressed:(id)sender {
    if (self.settingsViewController == nil) {
        self.settingsViewController = [[FBUserSettingsViewController alloc] init];
        self.settingsViewController.delegate = self;
    }
    
    [self.navigationController pushViewController:self.settingsViewController animated:YES];
    //[self presentViewController:self.settingsViewController animated:YES completion:nil];
}




#pragma mark - FBUserSettingsDelegate methods

- (void)loginViewControllerDidLogUserOut:(id)sender {
    // Facebook SDK * login flow *
    // There are many ways to implement the Facebook login flow.
    // In this sample, the FBLoginView delegate (SCLoginViewController)
    // will already handle logging out so this method is a no-op.
}

- (void)loginViewController:(id)sender receivedError:(NSError *)error{
    // Facebook SDK * login flow *
    // There are many ways to implement the Facebook login flow.
    // In this sample, the FBUserSettingsViewController is only presented
    // as a log out option after the user has been authenticated, so
    // no real errors should occur. If the FBUserSettingsViewController
    // had been the entry point to the app, then this error handler should
    // be as rigorous as the FBLoginView delegate (SCLoginViewController)
    // in order to handle login errors.
    if (error) {
        NSLog(@"Unexpected error sent to the FBUserSettingsViewController delegate: %@", error);
    }
}

@end
