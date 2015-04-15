//
//  OffersScreen.m
//  PriceShare
//
//  Created by Kloon on 2/12/15.
//  Copyright (c) 2015 Kloon. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookTableCell.h"

@implementation AddressBookViewController
@synthesize topBarView = _topBarView,
bottomBarView = _bottomBarView,
buttonBack = _buttonBack,
buttonSearchOffer = _buttonSearchOffer,
buttonAddOffer = _buttonAddOffer,
arrayOffers = _arrayOffers;

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    refreshControl.backgroundColor = [UIColor colorWithRed:184.0f/225.0f green:184.0f/225.0f blue:184.0f/225.0f alpha:1];
    refreshControl.tintColor = [UIColor whiteColor];
    [self.tableView addSubview:refreshControl];
    // add search Bar
    _searchBarMyOffer.showsCancelButton = YES;
    [_searchBarMyOffer sizeToFit];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBarMyOffer contentsController:self];
    searchDisplayController.delegate = (id)self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    [searchDisplayController setActive:NO animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {

}
- (void) reloadTableView {
//    [self.searchDisplayController.searchResultsTableView reloadData];
    [self.tableView reloadData];
    // End the refreshing
    [self endRefreshingControl];
}
- (void) endRefreshingControl {
    if (refreshControl) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        refreshControl.attributedTitle = attributedTitle;
        [refreshControl endRefreshing];
    }
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void) viewDidLayoutSubviews {
    [_searchBarMyOffer setFrame:CGRectMake(_topBarView.frame.origin.x,
                                         _topBarView.frame.origin.y + _topBarView.frame.size.height,
                                         _topBarView.frame.size.width,
                                          _topBarView.frame.size.height)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return [searchResults count];
//    }
//    else {
//        if (_arrayOffers) {
//            return [_arrayOffers count];
//        }
//    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"AddressBookTableCell";
    AddressBookTableCell *cell = (AddressBookTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"AddressBookTableCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[AddressBookTableCell class]]) {
                cell = (AddressBookTableCell *) currentObject;
                break;
            }
        }
        /*
            if (tableView == self.searchDisplayController.searchResultsTableView)
                offer = [searchResults objectAtIndex:indexPath.row];
            else
                offer = [_arrayOffers objectAtIndex:indexPath.row];
            if (offer)
                [cell configureCellWithOffer:offer atIndexPath:indexPath widthCell:self.tableView.frame.size.width];
         */
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark - CategoryTableViewControllerDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}
/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        OfferDTO *offer = [_arrayOffers objectAtIndex:indexPath.row];
        offerDeleted = [offer copy];
        NSString *stringDeleteAlert = [NSString stringWithFormat:@"%@%@", NSLocalizedString(@"mess_delete_offer", @""), offer.offerName];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                            message:stringDeleteAlert
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
}
- (void)adjustHeightOfTableview {
    //finding the number of cells in your table view by looping through its sections
    CGFloat height = self.tableView.rowHeight + 44;
    CGRect tableFrame = self.tableView.frame;
    tableFrame.size.height = height;
    self.tableView.frame = tableFrame;
}
- (void)deleteOfferSelected {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if ([[AppDelegate shareApp].internetReach isReachable]) {
        [[AppDelegate shareApp].networkRequestManager getServerDeleteOffer:offerDeleted.offerId WithDelegate:self WithSelector:@selector(deleteOffer) WithErrorSelector:@selector(failedToConnectToServer:)];
    }
    else {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        SHOW_ALERT(@"", NSLocalizedString(@"mess_CanNotConnectInternet", @""), nil, @"OK", nil);
    }

}
- (void)deleteOffer{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    // remove offer
    for (int i=0; i<_arrayOffers.count; i++) {
        OfferDTO *offer = [_arrayOffers objectAtIndex:i];
        if ([offer.offerId isEqualToString:offerDeleted.offerId]) {
            [_arrayOffers removeObject:offer];
            break;
        }
    }
    [self.tableView reloadData];
}
#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==1) {
        [self deleteOfferSelected];
    }
}
*/
#pragma mark - UISearchDisplayController Delegate Methods
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    [self.searchDisplayController setActive:NO animated:YES];
//    CGRect tableFrame = self.tableView.frame;
//    tableFrame.origin.y = _topBarView.frame.origin.y+_topBarView.frame.size.height;
//    self.tableView.frame = tableFrame;
}
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView {
    tableView.rowHeight = 72.0f; // or some other height
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF.offerName contains[c] %@", searchText];
    searchResults = [_arrayOffers filteredArrayUsingPredicate:resultPredicate];
//    if (searchResults.count>0) {
//        [self adjustHeightOfTableview:searchResults.count];
//    }
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self filterContentForSearchText:searchBar.text
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    [searchBar resignFirstResponder];
}
@end
