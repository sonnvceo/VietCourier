//
//  CommodityViewController.m
//  VietCourier
//
//  Created by SonNV on 2/4/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "CommodityViewController.h"
#import "CreateShipmentViewController.h"
@interface CommodityViewController ()

@end

@implementation CommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addButtonsToView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLayoutSubviews {
    float heightOfButton = (self.view.frame.size.height-64)/5;
    [_buttonCosmetics setFrame:CGRectMake(0, 64, self.view.frame.size.width, heightOfButton)];
    [_buttonClothers setFrame:CGRectMake(0, 64+heightOfButton, self.view.frame.size.width, heightOfButton)];
    [_buttonFood setFrame:CGRectMake(0, 64+heightOfButton*2, self.view.frame.size.width, heightOfButton)];
    [_buttonShoes setFrame:CGRectMake(0, 64+heightOfButton*3, self.view.frame.size.width, heightOfButton)];
    [_buttonOthers setFrame:CGRectMake(0, 64+heightOfButton*4, self.view.frame.size.width, heightOfButton)];
}
- (void) addButtonsToView {
    _buttonCosmetics = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonCosmetics addTarget:self action:@selector(submitswicthcButtonsCommondity:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonCosmetics setImage:[UIImage imageNamed:@"cosmetics.png"] forState:UIControlStateNormal];
    _buttonCosmetics.tag = 0;
    
    [self.view addSubview:_buttonCosmetics];
    
    _buttonClothers = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonClothers addTarget:self action:@selector(submitswicthcButtonsCommondity:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonClothers setImage:[UIImage imageNamed:@"clothes.png"] forState:UIControlStateNormal];
    _buttonClothers.tag = 1;
    
    [self.view addSubview:_buttonClothers];
    
    _buttonFood = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonFood addTarget:self action:@selector(submitswicthcButtonsCommondity:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonFood setImage:[UIImage imageNamed:@"food.png"] forState:UIControlStateNormal];
    _buttonFood.tag = 2;
    
    [self.view addSubview:_buttonFood];
    
    _buttonShoes = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonShoes addTarget:self action:@selector(submitswicthcButtonsCommondity:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonShoes setImage:[UIImage imageNamed:@"shoe.png"] forState:UIControlStateNormal];
    _buttonShoes.tag = 3;
    
    [self.view addSubview:_buttonShoes];
    
    _buttonOthers = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonOthers addTarget:self action:@selector(submitswicthcButtonsCommondity:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonOthers setImage:[UIImage imageNamed:@"other.png"] forState:UIControlStateNormal];
    _buttonOthers.tag = 4;
    
    [self.view addSubview:_buttonOthers];
}
- (IBAction)submitButtonBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)submitButtonCancel:(id)sender {

}
- (IBAction)submitswicthcButtonsCommondity:(id)sender {
    CreateShipmentViewController *createShipmentViewController = [[CreateShipmentViewController alloc] initWithNibName:@"CreateShipmentViewController" bundle:nil];
    switch ([sender tag]) {
        case 0:
            [self.navigationController pushViewController:createShipmentViewController animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:createShipmentViewController animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:createShipmentViewController animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:createShipmentViewController animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:createShipmentViewController animated:YES];
            break;
        default:
            break;
    }
}
@end
