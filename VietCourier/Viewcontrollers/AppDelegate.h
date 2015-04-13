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
    Menu *menu;
}
+ (AppDelegate *)shareAppDelegate;
@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) MTStackViewController *stackViewController;

@end

