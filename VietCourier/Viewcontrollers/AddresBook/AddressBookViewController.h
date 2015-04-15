//
//  OffersScreen.h
//  PriceShare
//
//  Created by Kloon on 2/12/15.
//  Copyright (c) 2015 Kloon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressBookViewController : UIViewController<UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource>     {
    UIRefreshControl *refreshControl;
    NSArray *searchResults;
    UISearchDisplayController *searchDisplayController;
    BOOL isStillInMyOffer;
}
@property(strong, nonatomic) IBOutlet UISearchBar *searchBarMyOffer;
@property(strong, nonatomic) IBOutlet UIView *topBarView;
@property(strong, nonatomic) IBOutlet UILabel *lblTitleAddOffer;
@property(strong, nonatomic) IBOutlet UIView *bottomBarView;
@property(strong, nonatomic) IBOutlet UIButton *buttonBack;
@property(strong, nonatomic) IBOutlet UIButton *buttonSearchOffer;
@property(strong, nonatomic) IBOutlet UIButton *buttonAddOffer;
@property(strong, nonatomic) IBOutlet UITableView *tableView;
@property(retain, nonatomic) NSMutableArray *arrayOffers;

- (IBAction)submitSwitchButtonsInBottomBar:(id)sender;
@end
