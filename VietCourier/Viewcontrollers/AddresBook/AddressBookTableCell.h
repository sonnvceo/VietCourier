//
//  EventTableCell.h
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryTableCellDelegate;

@interface AddressBookTableCell : UITableViewCell {
    UIView *separatorView;
}

@property (assign, nonatomic) id <CategoryTableCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *imgAccessory;
@property (strong, nonatomic) IBOutlet UILabel *lblNameOffer;
@property (strong, nonatomic) IBOutlet UILabel *lblAddressOffer;
@property (strong, nonatomic) IBOutlet UILabel *lblAvaiable;
//- (void) configureCellWithOffer:(OfferDTO*) offer atIndexPath:(NSIndexPath*) indexPath widthCell:(float) kWidth;
//- (void) configureImgVOfferStatus:(int)status;
- (void) configureCell:(NSIndexPath*) indexPath;
@end

@protocol CategoryTableCellDelegate <NSObject>
@optional
- (void) submitEventChangedButton:(id)sender;
@end