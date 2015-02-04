//
//  LadingViewController.h
//  VietCourier
//
//  Created by admin on 2/3/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LadingTableCell.h"

@interface LadingViewController : UIViewController <UITableViewDelegate,
                                                    UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableViewLading;
@end
