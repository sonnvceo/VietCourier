//
//  AppDelegate.h
//  VietCourier
//
//  Created by admin on 1/21/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTStackViewController.h"
#import "Menu.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    MTStackViewController *stackViewController;
    Menu *menu;
}

@property (strong, nonatomic) UIWindow *window;


@end

