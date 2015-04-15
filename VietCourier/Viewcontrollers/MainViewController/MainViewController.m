//
//  MainViewController.m
//  VietCourier
//
//  Created by admin on 4/12/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.camera = [GMSCameraPosition cameraWithLatitude:20.99106
                                              longitude:105.763435 zoom:14
                                                bearing:0
                                           viewingAngle:0];
    self.mapView = [GMSMapView mapWithFrame:_viewForMap.bounds camera:_camera];
    self.mapView.delegate = self;
    [self.viewForMap addSubview:_mapView];
//    self.TopBarView.hidden = YES;
//    self.BottomBarView.hidden = YES;
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showCurrentLocation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLayoutSubviews {
    CGRect viewForMapFrame = self.viewForMap.frame;
    viewForMapFrame.origin.y = 0;
    self.mapView.frame = viewForMapFrame;
}
- (void)showCurrentLocation {
    _mapView.myLocationEnabled = YES;
    [self.locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:newLocation.coordinate.latitude
                                                            longitude:newLocation.coordinate.longitude
                                                                 zoom:14];
    [_mapView animateToCameraPosition:camera];
}
#pragma MTStackViewControllerDelegate
- (IBAction)submitButtonMenuLeft:(id)sender {
    [[AppDelegate shareAppDelegate].stackViewController toggleLeftViewController];
}
- (IBAction)submitButtonShipNow:(id)sender {
    
}
@end
