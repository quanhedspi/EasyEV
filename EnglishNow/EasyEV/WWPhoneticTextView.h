//
//  WWPhoneticTextView.h
//  EnglishNow
//
//
//  Created by Dinh Quan  on 4/1/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWLabel.h"
#import "TabWordProtocol.h"

@interface WWPhoneticTextView : UIView
@property (nonatomic, retain) WWLabel *label;
@property (nonatomic, retain) id<TabWordProtocol> delegate;
- (void) configureView;
- (void) setText:(NSString *) text;

@end
