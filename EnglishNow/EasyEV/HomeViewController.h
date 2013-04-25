//
//  HomeViewController.h
//  EasyEV
//
//
//  Created by Dinh Quan  on 3/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SlideViewController.h"
#import "TabWordProtocol.h"
#import <FacebookSDK/FacebookSDK.h>

@interface HomeViewController : UIViewController <SlideViewControllerSlideDelegate, TabWordProtocol>
@property (strong, nonatomic) FBProfilePictureView *userProfileImage;
@end
