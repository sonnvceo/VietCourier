//
//  EventTableCell.m
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import "LadingTableCell.h"

@implementation LadingTableCell
@synthesize imgIcon,lblTitle,lbDetail, imgShadowIcon;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) configureCell {
    imgShadowIcon.layer.cornerRadius = imgShadowIcon.frame.size.width / 2;
    imgShadowIcon.clipsToBounds = YES;
    imgIcon.layer.cornerRadius = imgIcon.frame.size.width / 2;
    imgIcon.clipsToBounds = YES;
    imgShadowIcon.center = imgIcon.center;
    imgShadowIcon.hidden = YES;
    self.lblTitle.adjustsFontSizeToFitWidth = NO;
//    self.lblTitle.lineBreakMode = UILineBreakModeTailTruncation;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
