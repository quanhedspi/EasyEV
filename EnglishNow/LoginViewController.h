//
//  LoginViewController.h
//  EnglishNow
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController<FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *FBLoginView;

@end

