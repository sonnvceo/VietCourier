//
//  AppDelegate.m
//  VietCourier
//
//  Created by admin on 1/21/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "CreateShipmentViewController.h"
#import "DefinitionAPI.h"
#import "CommodityViewController.h"
#import "ProfileCustomerViewController.h"
#import "MainViewController.h"
#import "AddressBookDetailViewController.h"
#import "MenuTableViewController.h"
#import "CourierProfileViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize networkRequestManager = _networkRequestManager;

+ (AppDelegate *)shareAppDelegate {
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [GMSServices provideAPIKey:kGoogleAPIKey];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _networkRequestManager = [NetworkRequestManager shareInstance];
    CommodityViewController *commodityViewController = [[CommodityViewController alloc] initWithNibName:@"CommodityViewController" bundle:nil];
    CreateShipmentViewController *createShipmentViewController = [[CreateShipmentViewController alloc] initWithNibName:@"CreateShipmentViewController" bundle:nil];
    
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    ProfileCustomerViewController *profileCustomerViewController = [[ProfileCustomerViewController alloc] initWithNibName:@"ProfileCustomerViewController" bundle:nil];
    MainViewController *mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    AddressBookDetailViewController *addressBookViewController = [[AddressBookDetailViewController alloc] initWithNibName:@"AddressBookDetailViewController" bundle:nil];
    MenuTableViewController *menuTableViewController = [[MenuTableViewController alloc] initWithNibName:@"MenuTableViewController" bundle:nil];
    
     CourierProfileViewController *courierProfileViewController = [[CourierProfileViewController alloc] initWithNibName:@"CourierProfileViewController" bundle:nil];
    
    menu = [[Menu alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *contentNavigationController = [[UINavigationController alloc]
                                                           initWithRootViewController:mainViewController];
    contentNavigationController.navigationBar.hidden = YES;
    //
    _stackViewController = [[MTStackViewController alloc] initWithNibName:nil bundle:nil];
    [_stackViewController setAnimationDurationProportionalToPosition:YES];
    [_stackViewController setLeftViewController:menuTableViewController];
    [_stackViewController setContentViewController:contentNavigationController];
    //
    self.window.rootViewController = _stackViewController;
    _internetReach = [Reachability reachabilityForInternetConnection];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    [_internetReach startNotifier];

    [self.window makeKeyAndVisible];
    return YES;
}
- (void) reachabilityChanged: (NSNotification* )note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus) {
        case ReachableViaWWAN: {
            break;
        }
        case ReachableViaWiFi: {
            break;
        }
        case NotReachable: {
            SHOW_ALERT(@"", NSLocalizedString(@"mess_CanNotConnectInternet", @""), nil, @"OK", nil);
            break;
        }
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
