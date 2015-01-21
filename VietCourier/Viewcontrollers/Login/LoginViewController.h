//
//  LoginViewController.h
//  Fight
//
//  Created by gilgameshvn on 12/6/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SignUpViewController.h"
#import "MBProgressHUD.h"

@protocol loginDelegate <NSObject>;
@optional
- (void) touchDownAtItemAtIndex:(NSUInteger)itemIndex;
- (void) hideTabar;
- (void) showTabar;
@end

@interface LoginViewController : UIViewController<MBProgressHUDDelegate,
                                                  UITextFieldDelegate,
                                                  UITableViewDelegate,
                                                  UITableViewDataSource> {
  MBProgressHUD *HUD;
  UITextField* emailField;
  UITextField* passwordField ;
}
@property (nonatomic, strong) IBOutlet UIImageView *imgViewLogo;
@property (nonatomic, strong) IBOutlet UILabel     *lableLogo;
@property (nonatomic, strong) IBOutlet UITableView *tableLogin;
// Creates a textfield with the specified text and placeholder text
-(UITextField*) makeTextField: (NSString*)text
                  placeholder: (NSString*)placeholder  ;

// Handles UIControlEventEditingDidEndOnExit
- (IBAction)textFieldFinished:(id)sender ;

@property (nonatomic,copy) NSString* stringEmail ;
@property (nonatomic,copy) NSString* stringPassword ;

@property (nonatomic, strong) IBOutlet UITextField *email;
@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UIButton *btnLogin;
@property (nonatomic, strong) IBOutlet UIButton *btnSignUp;
@property (nonatomic, strong) IBOutlet UIButton *btnForgotPass;
@property (nonatomic, strong) id <loginDelegate> delegate;
@property (nonatomic, assign) BOOL isGoldLive;
-(IBAction) dismiss:(id)sender;
-(IBAction)btnLogin:(id)sender;
-(IBAction)btnSignUp:(id)sender;
-(IBAction)btnForgotPass:(id)sender;
@end
