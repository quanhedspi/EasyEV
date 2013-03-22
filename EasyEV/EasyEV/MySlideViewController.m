//
//  MySlideViewController.m
//  SlideViewController
//
//  Created by Andrew Carter on 12/18/11.

#import "MySlideViewController.h"

#import "HomeViewController.h"
#import "WordsViewController.h"
#import "StoryViewController.h"
#import "SettingsViewController.h"

@implementation MySlideViewController

@synthesize datasource = _datasource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        //creating _searchDatasource for later use!
        _searchDatasource = [NSMutableArray new];
        
        NSMutableArray *datasource = [NSMutableArray array];
        
        /*
        Here's the fun part. What we need to do is creat a datasource array that uses this structure
         
         <Array>
            <Dictionary><!--represents a section in the table-->
                
                <!--This will be displayed as the text in section header. You could also use kSlideViewControllerSectionTitleNoTitle for the value-->
                <key>kSlideViewControllerSectionTitleKey</key>
                <value>My Section Header Text</value>
            
                <!--This will be the rows of that section.-->
                <key>kSlideViewControllerSectionViewControllersKey</key>
                <value>
                    <Array>
         
                        <Dictionary>
         
                            <!--this will be the title for the row-->
                            <key>kSlideViewControllerViewControllerTitleKey</key>
                            <value>My Text</value>
         
                            <!--This is the view controller class that should be created / displayed when this row is clicked-->
                            <key>kSlideViewControllerViewControllerClassKey</key>
                            <value>[MyViewControllerSubclass class]</value>
                            
                            <!--If you're using nibs, include the nib name in this key-->
                            <key>kSlideViewControllerViewControllerNibNameKey</key>
                            <value>MyViewControllerSubclass</value>
                            
                            <!--Include a UIImage with this key to have an icon for the row -->
                            <key>kSlideViewControllerViewControllerIconKey</key>
                            <value>*UIImage*</value>
         
                            <!--This gets passed along with the configureViewController:userInfo: method if you implement it-->
                            <key>kSlideViewControllerViewControllerUserInfoKey</key>
                            <value>anything you want</value>
         
                        </Dictionary>
         
                    </Array>
                </value>
         
            </Dictionary><!--end table section-->
         </Array>
        
         
         */
        NSMutableDictionary *sectionOne = [NSMutableDictionary dictionary];
        [sectionOne setObject:kSlideViewControllerSectionTitleNoTitle forKey:kSlideViewControllerSectionTitleKey];
        
        //home
        NSMutableDictionary *homeViewControllerDictionary = [NSMutableDictionary dictionary];
        [homeViewControllerDictionary setObject:@"Home" forKey:kSlideViewControllerViewControllerTitleKey];
        [homeViewControllerDictionary setObject:@"HomeViewController" forKey:kSlideViewControllerViewControllerNibNameKey];
        [homeViewControllerDictionary setObject:[HomeViewController class] forKey:kSlideViewControllerViewControllerClassKey];
        [homeViewControllerDictionary setObject:[UIImage imageNamed:@"home.png"] forKey:kSlideViewControllerViewControllerIconKey];
        //words
        NSMutableDictionary *wordsViewControllerDictionary = [NSMutableDictionary dictionary];
        [wordsViewControllerDictionary setObject:@"Words" forKey:kSlideViewControllerViewControllerTitleKey];
        [wordsViewControllerDictionary setObject:@"WordsViewController" forKey:kSlideViewControllerViewControllerNibNameKey];
        [wordsViewControllerDictionary setObject:[WordsViewController class] forKey:kSlideViewControllerViewControllerClassKey];
        [wordsViewControllerDictionary setObject:[UIImage imageNamed:@"word.png"] forKey:kSlideViewControllerViewControllerIconKey];
        
        //read story
        NSMutableDictionary *storyViewControllerDictionary = [NSMutableDictionary dictionary];
        [storyViewControllerDictionary setObject:@"  Story" forKey:kSlideViewControllerViewControllerTitleKey];
        [storyViewControllerDictionary setObject:@"StoryViewController" forKey:kSlideViewControllerViewControllerNibNameKey];
        [storyViewControllerDictionary setObject:[StoryViewController class] forKey:kSlideViewControllerViewControllerClassKey];
        [storyViewControllerDictionary setObject:[UIImage imageNamed:@"book.png"] forKey:kSlideViewControllerViewControllerIconKey];

        //settings
        NSMutableDictionary *settingsViewControllerDictionary = [NSMutableDictionary  dictionary];
        [settingsViewControllerDictionary setObject:@"Settings" forKey:kSlideViewControllerViewControllerTitleKey];
        [settingsViewControllerDictionary setObject:[SettingsViewController class] forKey:kSlideViewControllerViewControllerClassKey];
        [settingsViewControllerDictionary setObject:[UIImage imageNamed:@"settings.png"] forKey:kSlideViewControllerViewControllerIconKey];
        
        [sectionOne setObject:[NSArray arrayWithObjects:homeViewControllerDictionary, wordsViewControllerDictionary, storyViewControllerDictionary, settingsViewControllerDictionary, nil] forKey:kSlideViewControllerSectionViewControllersKey];
        
        [datasource addObject:sectionOne];
        
        
        _datasource = datasource;
        
    }
    
    return self;
}


- (UIViewController *)initialViewController {
    
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    return homeViewController;
    
}

- (NSIndexPath *)initialSelectedIndexPath {
    
    return [NSIndexPath indexPathForRow:0 inSection:0];
    
}


- (void)configureSearchDatasourceWithString:(NSString *)string {

    NSArray *searchableControllers = [[[self datasource] objectAtIndex:1] objectForKey:kSlideViewControllerSectionViewControllersKey];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"slideViewControllerViewControllerTitle CONTAINS[cd] %@", string];
    [_searchDatasource setArray:[searchableControllers filteredArrayUsingPredicate:predicate]];
    
}

- (NSArray *)searchDatasource  {
    
    return _searchDatasource;
}


@end
