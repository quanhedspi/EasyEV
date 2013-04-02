//
//  WWLabel.m
//  SVST Bridging Words
//
//  Created by Mahmood1 on 2/6/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "WWLabel.h"

#define WWLabelDefaultInset 5

@implementation WWLabel

@synthesize topInset, leftInset, bottomInset, rightInset;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.topInset = WWLabelDefaultInset;
        self.bottomInset = WWLabelDefaultInset;
        self.rightInset = WWLabelDefaultInset;
        self.leftInset = WWLabelDefaultInset;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets insets = {self.topInset, self.leftInset,
        self.bottomInset, self.rightInset};
    
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end