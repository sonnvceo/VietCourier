//
//  MainViewController.h
//  VietCourier
//
//  Created by admin on 4/12/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "MTStackViewController.h"
@interface MainViewController : UIViewController<GMSMapViewDelegate> {
    MTStackViewController *stackViewControlle;
}

- (IBAction)submitButtonMenuLeft:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewForMap;
@property (strong, nonatomic) IBOutlet UIView *TopBarView;
@property (strong, nonatomic) IBOutlet UIView *BottomBarView;
@property (nonatomic, strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) IBOutlet GMSCameraPosition *camera;
@property (nonatomic, retain) CLLocationManager *locationManager;
- (IBAction)submitButtonShipNow:(id)sender;
@end
