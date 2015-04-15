//
//  EventTableCell.m
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import "AddressBookTableCell.h"

@implementation AddressBookTableCell
@synthesize imgAccessory;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) configureCell:(NSIndexPath*) indexPath {
    imgAccessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_filter_more.png"]];
    if (IS_IPHONE6) {
        [imgAccessory setFrame:CGRectMake(310, 4, 36, 36)];
    }
    else if (IS_IPHONE6_PLUS) {
        [imgAccessory setFrame:CGRectMake(264, 4, 36, 36)];
    }
    else {
        [imgAccessory setFrame:CGRectMake(254, 4, 36, 36)];
    }
    [self addSubview:imgAccessory];
    imgAccessory.hidden = YES;
}
//- (void) viewDidLayoutSubviews {
//    separatorView.frame = CGRectMake(0, 0, self.frame.size.width, separatorView.frame.size.height);
//}
//- (void) configureCellWithOffer:(OfferDTO*) offer atIndexPath:(NSIndexPath*) indexPath widthCell:(float) kWidth {
//    separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1.5, kWidth, 1.5)];
//    separatorView.layer.borderColor = [UIColor colorWithRed:24.0f/225 green:134.0f/225 blue:251.0f/225 alpha:1].CGColor;
//    separatorView.layer.borderWidth = 1.0;
//    _imgVOffer.contentMode = UIViewContentModeScaleAspectFill;
//    _imgVOffer.layer.masksToBounds = YES;
//    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    activityIndicator.frame = _imgVOffer.frame;
//    activityIndicator.center = _imgVOffer.center;
//    [activityIndicator startAnimating];
//    [self addSubview:activityIndicator];
//    [self.contentView addSubview:separatorView];
//    UIImage *imageCache  = [[ModelDefine shareManager].imageCache objectForKey:offer.offerId];
//    if (imageCache) {
//        [activityIndicator stopAnimating];
//        [_imgVOffer setImage:imageCache];
//    }
//    else {
//        if (offer.OfferURL.length>0) {
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                // retrive image on global queue
//                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:offer.OfferURL]]];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [activityIndicator stopAnimating];
//                    if (image) {
//                        [_imgVOffer setImage:image];
//                        [[ModelDefine shareManager] cacheImage:image imageNamed:offer.offerId];
//                    }
//                    else
//                        [_imgVOffer setImage:[UIImage imageNamed:@"icon_my_offer_avatar.png"]];
//                });
//            });
//        }
//        else {
//            [activityIndicator stopAnimating];
//            [_imgVOffer setImage:[UIImage imageNamed:@"icon_my_offer_avatar.png"]];
//        }
//    }
//    if (offer.offerName) {
//        [_lblNameOffer setText:offer.offerName];
//    }
//    if (offer.offerAddress) {
//        [_lblAddressOffer setText:offer.offerAddress];
//    }
//    // convert date
//    NSDateFormatter *firstDateFormatter = [[NSDateFormatter alloc] init];
//    [firstDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *date;
//    NSDate* currentdate = [NSDate date];
//    if (offer.availableDate.length>0)
//        date = [firstDateFormatter dateFromString:offer.availableDate];
//
//    NSDateFormatter *secondDateFormatter = [[NSDateFormatter alloc] init];
//    [secondDateFormatter setDateFormat:@"dd LLLL yyyy HH:mm:ss"];
//    NSString *stringDate = [secondDateFormatter stringFromDate:date];
//    if (stringDate.length>0)
//        _lblAvaiable.text = [NSString stringWithFormat:@"Available: %@", stringDate];
//    if ([date laterDate:currentdate] == currentdate) {
//        [_lblAvaiable setTextColor:[UIColor colorWithRed:252.0f/255.0f green:74.0f/255.0f blue:77.0f/255.0f alpha:1]];
//    }
//    else
//        [_lblAvaiable setTextColor:[UIColor colorWithRed:25.0f/255.0f green:137.0f/255.0f blue:251.0f/255.0f alpha:1]];
//    [self configureImgVOfferStatus:[offer.offerStatus intValue]];
//}
//- (IBAction)submitButtonCheck:(id)sender {
//    if (delegate && [delegate respondsToSelector:@selector(submitEventChangedButton:)]) {
//        [delegate submitEventChangedButton:sender];
//    }
//}
//- (void) configureImgVOfferStatus:(int)status {
//    switch (status) {
//        case kOfferWatting:
//            [_imgVOfferStatus setImage:[UIImage imageNamed:@"icon_my_offer_waiting.png"]];
//            break;
//        case kOfferApproval:
//            [_imgVOfferStatus setImage:[UIImage imageNamed:@"icon_my_offer_approve.png"]];
//            break;
//        case kOfferReject:
//            [_imgVOfferStatus setImage:[UIImage imageNamed:@"icon_my_offer_reject.png"]];
//            break;
//        default:
//            break;
//    }
//}
//- (void)willTransitionToState:(UITableViewCellStateMask)state
//{
//    [super willTransitionToState:state];
//    if ((state & UITableViewCellStateShowingDeleteConfirmationMask) == UITableViewCellStateShowingDeleteConfirmationMask)
//    {
//        for (UIView *subview in self.subviews)
//        {
//            if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"])
//            {
//                UIImageView *deleteBtn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 33)];
//                [deleteBtn setImage:[UIImage imageNamed:@"icon_my_offer_delete.png"]];
//                [[subview.subviews objectAtIndex:0] addSubview:deleteBtn];
//            }
//        }
//    }
//}
@end
