//
//  CommodityViewController.h
//  VietCourier
//
//  Created by SonNV on 2/4/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommodityViewController : UIViewController

@property(nonatomic, strong) IBOutlet UIButton *buttonCosmetics;
@property(nonatomic, strong) IBOutlet UIButton *buttonClothers;
@property(nonatomic, strong) IBOutlet UIButton *buttonFood;
@property(nonatomic, strong) IBOutlet UIButton *buttonShoes;
@property(nonatomic, strong) IBOutlet UIButton *buttonOthers;
- (IBAction)submitButtonBack:(id)sender;
- (IBAction)submitButtonCancel:(id)sender;
- (IBAction)submitswicthcButtonsCommondity:(id)sender;
@end
