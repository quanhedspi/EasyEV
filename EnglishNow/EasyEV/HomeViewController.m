//
//  HomeViewController.m
//  EnglishNow
//
//
//  Created by Dinh Quan  on 3/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import "HomeViewController.h"
#import "WWPhoneticTextView.h"

@implementation HomeViewController 
{
    UIScrollView * sentenceScroll;
    UIScrollView * dictScroll;
    WWPhoneticTextView *sentenceTextView;
    UITextView * dictText;
    
}

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
    self.navigationItem.title = @"Home";
    // Do any additional setup after loading the view from its nib.
    dictScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 10, 320, 130)];
    dictText = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, 130)];
    sentenceScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 320, 100)];
    sentenceTextView = [[WWPhoneticTextView alloc] initWithFrame:CGRectMake(10, 0, 300, 300)];
    sentenceTextView.delegate = self;
    [sentenceScroll setBackgroundColor:[UIColor whiteColor]];
    
    
    [sentenceTextView configureView];
    NSString * text = @"The United States international scored 60 goals in 224 appearances for the Cottagers but joined Spurs at the end of August. The United States international scored 60 goals in 224 appearances for the Cottagers but joined Spurs at the end of AugustThe United States international scored 60 goals in 224 appearances for the Cottagers but joined Spurs at the end of August";
    [sentenceTextView setText:text];
    CGSize maximumSize = CGSizeMake(300, 9998);
    CGSize storyStringSize = [text sizeWithFont:sentenceTextView.label.font
                              constrainedToSize:maximumSize
                                  lineBreakMode:sentenceTextView.label.lineBreakMode];
    sentenceTextView.label.frame = CGRectMake(0, 0, 310, storyStringSize.height);
//    [sentenceTextView setBackgroundColor:[UIColor yellowColor]];

    [dictScroll addSubview:dictText];
    [sentenceScroll addSubview:sentenceTextView];
    
    [sentenceScroll setUserInteractionEnabled:YES];
    
    [self.view addSubview:dictScroll];
    [self.view addSubview:sentenceScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) wordTab:(NSString *)word {
    [dictText setText:word];

}

@end
