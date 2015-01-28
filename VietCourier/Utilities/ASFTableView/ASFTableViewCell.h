//
//  ASFTableViewCell.h
//  Patient Care
//
//  Created by Asif Mujteba on 01/02/2014.
//  Copyright (c) 2014 Asif Mujteba. All rights reserved.
//

// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net


#import <UIKit/UIKit.h>

#define kDEFAULT_MIN_HEIGHT  44.0f
#define kDEFAULT_FONT_SIZE   14.0f

@interface ASFTableViewCell : UITableViewCell

@property (nonatomic, retain) NSObject *rowId;
@property (nonatomic, assign) int minHeight;

- (void)setColumns:(NSArray *)aArr Options:(NSDictionary *)aOptions IsInnerRow:(BOOL)isInnerRow;

@end
