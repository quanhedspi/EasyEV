//
//  WWPhoneticTextView.h
//  SVST Bridging Words
//
//  Created by Mahmood1 on 2/6/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWLabel.h"

@interface WWPhoneticTextView : UIView
@property (nonatomic, retain) WWLabel *label;
- (void) configureView;
- (void) setText:(NSString *) text;

@end
