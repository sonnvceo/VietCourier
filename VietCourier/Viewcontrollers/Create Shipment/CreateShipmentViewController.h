//
//  LadingViewController.h
//  VietCourier
//
//  Created by admin on 2/3/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreateShipmentViewController : UIViewController <GMSMapViewDelegate>{
    UIAlertView *dialogView;
}
@property (strong, nonatomic) IBOutlet UIView *viewForMap;
@property (strong, nonatomic) IBOutlet UIView *viewAddressFrom;
@property (strong, nonatomic) IBOutlet UIView *viewAddressTo;
@property (nonatomic, strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) IBOutlet GMSCameraPosition *camera;
@end
