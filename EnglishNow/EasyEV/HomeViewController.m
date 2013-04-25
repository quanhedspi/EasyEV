//
//  HomeViewController.m
//  EnglishNow
//  ban nay push len server
//
//  Created by Dinh Quan  on 3/21/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import "Utils.h"
#import "HomeViewController.h"
#import "WWPhoneticTextView.h"

@implementation HomeViewController 
{
    
    int currentSentenceViewIndex;
    
    NSMutableArray * sentenceViewArray;
    NSMutableArray * gestureArray;
    
    UIScrollView * dictScroll;
    UITextView * dictText;
    
}
@synthesize userProfileImage;


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
    userProfileImage = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(300, 100, 100, 100)];

    // Do any additional setup after loading the view from its nib.
    dictScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 10, 320, 130)];
    dictText = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, 130)];

    [dictScroll addSubview:dictText];
    [self.view addSubview:dictScroll];
    gestureArray = [[NSMutableArray alloc] initWithObjects: nil];
    for (int i=0; i<3; i++) {
        UISwipeGestureRecognizer *mSwipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
        
        [mSwipeUpRecognizer setDirection:(UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight)];
        
        [gestureArray addObject:mSwipeUpRecognizer];
    }
   
    sentenceViewArray = [[NSMutableArray alloc] initWithObjects: nil];
    NSArray * sentenceArray = [NSArray arrayWithObjects:@"this issue happened to me last night and I actually did have a label named title",@"I tore a bit of my hair out when changing the name to something else didn't work",@"I fixed it by assigning a default value to the string object when the user doesn't enter a title in VC1", nil];
    currentSentenceViewIndex = 1;
    for (int i=0; i<3; i++) {
        UIScrollView * scrollView = [self createASentenceView:[sentenceArray objectAtIndex:i] withIndex:i];
        [self.view addSubview:scrollView];

        [scrollView addGestureRecognizer:[gestureArray objectAtIndex:i]];
        [sentenceViewArray addObject:scrollView];
    }
    [self handleSwipeGesture:nil];
    [self handleSwipeGesture:nil];
    
    [self populateUserDetails];
}

- (UIScrollView *) createASentenceView: (NSString *) text withIndex: (int) index {
    UIScrollView * _sentenceScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 320, 100)];
    [_sentenceScroll setBackgroundColor:[UIColor whiteColor]];
    
    
    WWPhoneticTextView * _sentenceTextView = [[WWPhoneticTextView alloc] initWithFrame:CGRectMake(10, 0, 300, 300)];
    _sentenceTextView.delegate = self;
    [_sentenceTextView configureView];

    [_sentenceTextView setText:text];
    
    CGSize maximumSize = CGSizeMake(300, 9999);
    CGSize storyStringSize = [text sizeWithFont:_sentenceTextView.label.font
                              constrainedToSize:maximumSize
                                  lineBreakMode:_sentenceTextView.label.lineBreakMode];
    _sentenceTextView.label.frame = CGRectMake(0, 0, 310, storyStringSize.height);
//    if (index == 0)
//        [_sentenceTextView setBackgroundColor:[UIColor yellowColor]];
//    else if (index == 1)
//        [_sentenceTextView setBackgroundColor:[UIColor greenColor]];
//    else
//        [_sentenceTextView setBackgroundColor:[UIColor blueColor]];
    
    [_sentenceScroll setUserInteractionEnabled:YES];
    [_sentenceScroll addSubview:_sentenceTextView];
    
    return _sentenceScroll;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) wordTab:(NSString *)word {
    [dictText setText:word];
    NSString * mean = [Utils search:[word lowercaseString]];
    if ([mean isEqual:@""]) {
        mean = [Utils search:[[word substringToIndex:[word length]-1] lowercaseString]];
        if ([mean isEqual:@""]) {
            mean = [Utils search:[[word substringToIndex:[word length]-2] lowercaseString]];
        }
    }
    [dictText setText:mean];
}

-(void)swipeFromView:(UIView *)visibleView
              toView:(UIView *)pushingView
           direction:(UISwipeGestureRecognizerDirection)aDirection {
    // assuming the content of pushingView already set
    CGPoint visibleViewCenter = [visibleView center]; // register the center
    CGRect visibleViewFrame = [visibleView frame];
    CGPoint pushingViewCenter, visibleViewNewCenter;
    
    visibleViewNewCenter.y = visibleViewCenter.y;
    pushingViewCenter.y = visibleViewCenter.y;
    
    // I use 2 here, but you would make more calculations
    pushingViewCenter.x = 2 * visibleViewFrame.size.width;
    visibleViewNewCenter.x = -1 * 2 *visibleViewFrame.size.width;
    // reversing x if direction is right
    if(aDirection == UISwipeGestureRecognizerDirectionRight) {
        pushingViewCenter.x *= -1;
        visibleViewNewCenter.x *= -1;
    }
    // once the tmp center for pushingView is calculated
    // set it, and run the animation
    [pushingView setCenter:pushingViewCenter];
    [UIView animateWithDuration:1.0
                     animations:^{
                         [visibleView setCenter:visibleViewNewCenter];
                         [pushingView setCenter:visibleViewCenter];
                     }];
}


// somewhere else, you handle the swipe
-(void)handleSwipeGesture:(UISwipeGestureRecognizer *)sender {
    // set content, etc
    int a= currentSentenceViewIndex;
    int b = currentSentenceViewIndex+1;
    if (b==3) b = 0;
    NSLog(@"switch view %d->%d", a, b);
    UIScrollView * scrollView1 = [sentenceViewArray objectAtIndex:a];
    UIScrollView * scrollView2 = [sentenceViewArray objectAtIndex:b];
    [self swipeFromView:scrollView1 toView:scrollView2 direction:[sender direction]];
    currentSentenceViewIndex = b;
}

// Ham de lay ve info cua user gom co ID, name, link ava
- (void)populateUserDetails {
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
             if (!error) {
                 NSLog(@"%@", user.name);
                 NSLog(@"%@", user.id);
                 NSLog(@"%@", user.username);
                 NSLog(@"%@", user.first_name);
                 NSLog(@"%@", user.link);
                 self.userProfileImage.profileID = [user objectForKey:@"id"];
             }
         }];
    }
}
@end
