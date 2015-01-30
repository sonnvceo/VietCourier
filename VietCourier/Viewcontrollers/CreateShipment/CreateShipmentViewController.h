//
//  CreateShipmentViewController.h
//  VietCourier
//
//  Created by SonNV on 1/30/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapView.h"
#import "NIDropDown.h"
@interface CreateShipmentViewController : UIViewController <MapViewDelegate,
                                                            NIDropDownDelegate> {
    MapView* mapView;
    NIDropDown *dropDown;
}
@property (retain, nonatomic) IBOutlet UIView* subMapView;
@property (retain, nonatomic) IBOutlet UIButton* buttonDropMenu;
- (IBAction)buttonDropMenuClicked:(id)sender;
@end
