//
//  SettingsViewController.h
//  EasyEV
//
//
//  Created by Dinh Quan  on 3/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SettingsViewController : UIViewController<FBUserSettingsDelegate>
@property (strong, nonatomic) FBUserSettingsViewController *settingsViewController;
-(IBAction)settingsButtonWasPressed:(id)sender;

@end
