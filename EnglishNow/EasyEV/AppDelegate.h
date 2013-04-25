//
//  AppDelegate.h
//  EasyEV
//
//  Created by Dinh Quan  on 3/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@class MySlideViewController;
@class LoginViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) MySlideViewController *slideViewController;

@property (strong, nonatomic) LoginViewController* loginViewController;

@property BOOL isNavigating;

@end
