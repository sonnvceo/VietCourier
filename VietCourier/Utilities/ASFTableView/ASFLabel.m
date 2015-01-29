//
//  ASFLabel.m
//  Patient Care
//
//  Created by Asif Mujteba on 01/02/2014.
//  Copyright (c) 2014 Asif Mujteba. All rights reserved.
//

// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net


#import "ASFLabel.h"

@interface ASFLabel () {
    int padding;
}

@end

@implementation ASFLabel

- (void)setPadding:(NSInteger)aPadding {
    padding = (int)aPadding;
    [self setNeedsDisplay];
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, padding, 0, padding))];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    return CGRectInset([self.attributedText boundingRectWithSize:CGSizeMake(999, 999)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                         context:nil], -padding, 0);
}

@end
