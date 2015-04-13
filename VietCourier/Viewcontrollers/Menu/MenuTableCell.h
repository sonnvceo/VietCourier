//
//  EventTableCell.h
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryTableCellDelegate;

@interface MenuTableCell : UITableViewCell

@property (assign, nonatomic) id <CategoryTableCellDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIImageView *imgLogo;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

- (void) configureCell:(NSIndexPath*) indexPath;
- (void) configureChangedCell:(int)status;
@end

@protocol CategoryTableCellDelegate <NSObject>
@optional
- (void) submitEventChangedButton:(id)sender;
@end