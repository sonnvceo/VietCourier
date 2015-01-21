//
//  SignUpViewController.h
//  Fight
//
//  Created by gilgameshvn on 12/6/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface SignUpViewController : UIViewController
{
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) IBOutlet UIWebView *webViewRegister;

@end
