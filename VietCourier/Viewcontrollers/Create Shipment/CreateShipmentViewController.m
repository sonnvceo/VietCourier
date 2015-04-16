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
    [self showAlert];
}
-(void)showAlert{
    dialogView =[[UIAlertView alloc] initWithTitle:@"ADD item" message:@"Put it blank textfield will cover this" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    UITextField *txtName = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
    txtName.text=@"";
    [txtName setBackgroundColor:[UIColor whiteColor]];
    [txtName setKeyboardAppearance:UIKeyboardAppearanceAlert];
    [txtName setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    [txtName setTextAlignment:NSTextAlignmentCenter];
    [dialogView addSubview:txtName];
    [dialogView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
