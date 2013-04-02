//
//  WWPhoneticTextView.m
//  SVST Bridging Words
//
//  Created by Mahmood1 on 2/6/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//
#import "WWPhoneticTextView.h"
#import "WWLabel.h"

#define WWPhoneticTextViewInset 5
#define WWPhoneticTextViewDefaultColor [UIColor blackColor]
#define WWPhoneticTextViewHighlightColor [UIColor yellowColor]

#define UILabelMagicTopMargin 5
#define UILabelMagicLeftMargin -5

@implementation WWPhoneticTextView {
WWLabel *label;
NSMutableAttributedString *labelText;
NSRange tappedRange;
}
@synthesize label;
// ... skipped init methods, very simple, just call through to configureView

- (void)configureView
{
    if(!label) {
        tappedRange.location = NSNotFound;
        tappedRange.length = 0;
        
        label = [[WWLabel alloc] initWithFrame:[self bounds]];
        //[label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setLineBreakMode:UILineBreakModeWordWrap];
        [label setNumberOfLines:0];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTopInset:WWPhoneticTextViewInset];
        [label setLeftInset:WWPhoneticTextViewInset];
        [label setBottomInset:WWPhoneticTextViewInset];
        [label setRightInset:WWPhoneticTextViewInset];
        label.text = @"This is a sample text";
        
        [self addSubview:label];
    }
    
    
    // Setup tap handling
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(handleSingleTap:)];
    singleFingerTap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleFingerTap];
}

- (void)setText:(NSString *)text
{
//    labelText = [[NSMutableAttributedString alloc] initWithString:text];
//    [label setAttributedText:labelText];
    label.text = text;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"touched");
        // Get the location of the tap, and normalise for the text view (no margins)
        CGPoint tapPoint = [sender locationInView:sender.view];
        tapPoint.x = tapPoint.x - WWPhoneticTextViewInset - UILabelMagicLeftMargin;
        tapPoint.y = tapPoint.y - WWPhoneticTextViewInset - UILabelMagicTopMargin;
        
        // Iterate over each word, and check if the word contains the tap point in the correct line
        __block NSString *partialString = @"";
        __block NSString *lineString = @"";
        __block int currentLineHeight = label.font.pointSize;
        [label.text enumerateSubstringsInRange:NSMakeRange(0, [label.text length]) options:NSStringEnumerationByWords usingBlock:^(NSString* word, NSRange wordRange, NSRange enclosingRange, BOOL* stop){
            printf("Checking %s\n",[word UTF8String]);
            
            CGSize sizeForText = CGSizeMake(label.frame.size.width-2*WWPhoneticTextViewInset, label.frame.size.height-2*WWPhoneticTextViewInset);
            partialString = [NSString stringWithFormat:@"%@ %@", partialString, word];
            
            // Find the size of the partial string, and stop if we've hit the word
            CGSize partialStringSize  = [partialString sizeWithFont:label.font constrainedToSize:sizeForText lineBreakMode:label.lineBreakMode];
            
            if (partialStringSize.height > currentLineHeight) {
                // Text wrapped to new line
                currentLineHeight = partialStringSize.height;
                lineString = @"";
            }
            lineString = [NSString stringWithFormat:@"%@ %@", lineString, word];
            
            CGSize lineStringSize  = [lineString sizeWithFont:label.font constrainedToSize:label.frame.size lineBreakMode:label.lineBreakMode];
            lineStringSize.width = lineStringSize.width + WWPhoneticTextViewInset;
            
            printf("Tap point x: %f AndString Size: %f\n", tapPoint.x, lineStringSize.width);
            printf("Tap point y: %f AndString Size: %f\n", tapPoint.y, (partialStringSize.height-label.font.pointSize));
            
            if (tapPoint.x < lineStringSize.width && tapPoint.y > (partialStringSize.height-label.font.pointSize) && tapPoint.y < partialStringSize.height) {
                NSLog(@"Tapped word %@", word);
                if (tappedRange.location != NSNotFound) {
                    //[labelText addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:tappedRange];
                }
                
                tappedRange = wordRange;
                //[labelText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:tappedRange];
                //[label setAttributedText:labelText];
                *stop = YES;
            }
        }];        
    }
}


@end
