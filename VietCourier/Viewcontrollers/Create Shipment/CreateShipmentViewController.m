//
//  LadingViewController.m
//  VietCourier
//
//  Created by admin on 2/3/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "CreateShipmentViewController.h"

@interface CreateShipmentViewController ()

@end

@implementation CreateShipmentViewController

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

    [self showAlert];
}
-(void)showAlert{
    dialogView = [[UIAlertView alloc] initWithTitle:@"Giá trị hàng hoá" message:@"" delegate:nil cancelButtonTitle:@"Bỏ qua" otherButtonTitles:@"Đồng ý", nil];
    UITextField *valueTextField = [[UITextField alloc] init];
    valueTextField.placeholder = @"vnd";
    valueTextField.textAlignment = NSTextAlignmentCenter;
    [dialogView setValue:valueTextField forKey:@"accessoryView"];
    valueTextField.textColor = [UIColor blackColor];
    valueTextField.keyboardType = UIKeyboardTypeNumberPad;
    [dialogView show];
}
- (void) viewDidLayoutSubviews {
    CGRect viewForMapFrame = self.viewForMap.frame;
    viewForMapFrame.origin.y = 0;
    self.mapView.frame = viewForMapFrame;
    [self addBottomBorderForView:self.viewAddressFrom WithColor:[UIColor colorWithRed:187.0f/225.0f green:187.0f/225.0f blue:187.0f/225.0f alpha:1] andWidth:1];
    [self addBottomBorderForView:self.viewAddressTo WithColor:[UIColor colorWithRed:187.0f/225.0f green:187.0f/225.0f blue:187.0f/225.0f alpha:1] andWidth:1];
    [self addLeftBorderForView:self.viewAddressTo WithColor:[UIColor colorWithRed:187.0f/225.0f green:187.0f/225.0f blue:187.0f/225.0f alpha:1] andWidth:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addTopBorderForView:(UIView*)view WithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    border.frame = CGRectMake(0, 0, view.frame.size.width, borderWidth);
    [view addSubview:border];
}
- (void)addBottomBorderForView:(UIView*)view WithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    border.frame = CGRectMake(0, view.frame.size.height-1, view.frame.size.width, borderWidth);
    [view addSubview:border];
}
- (void)addLeftBorderForView:(UIView*)view WithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin];
    border.frame = CGRectMake(0, 0, borderWidth, view.frame.size.height);
    [view addSubview:border];
}
@end
