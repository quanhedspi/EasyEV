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

- (void)loadView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f)];
    view.backgroundColor = [UIColor whiteColor];
    
    self.view = view;
    
}

- (void)viewDidLoad {
    
    self.navigationItem.title = @"Settings";
    
}

@end
