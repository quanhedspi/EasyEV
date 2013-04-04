//
//  WWLabel.m
//  EnglishNow
//
//
//  Created by Dinh Quan  on 4/1/13.
//  Copyright (c) 2013 Dinh Quan. All rights reserved.
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