//
//  WordsViewController.m
//  EasyEV
//
//  Created by Dinh Quan  on 3/22/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import "WordsViewController.h"

@interface WordsViewController ()

@end

@implementation WordsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Words";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
