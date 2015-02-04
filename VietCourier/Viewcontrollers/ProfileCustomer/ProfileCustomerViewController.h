//
//  ProfileCustomerViewController.h
//  VietCourier
//
//  Created by SonNV on 2/4/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCustomerViewController : UIViewController<UITabBarDelegate,
                                                            UITableViewDataSource,
                                                            UITextFieldDelegate> {
    UITextField* emailField;
    UITextField* fullNameField;
    UITextField* addressField;
    UITextField* districtField;
}

@property(nonatomic, retain) IBOutlet UITableView *tableViewProfile;
@property (nonatomic,copy) NSString* stringEmail ;
@property (nonatomic,copy) NSString* stringFullname ;
@property (nonatomic,copy) NSString* stringAddress ;
@property (nonatomic,copy) NSString* stringDistrict ;

@property (nonatomic, strong) IBOutlet UITextField* email;
@property (nonatomic, strong) IBOutlet UITextField* fullName;
@property (nonatomic, strong) IBOutlet UITextField* address;
@property (nonatomic, strong) IBOutlet UITextField* district;
// Creates a textfield with the specified text and placeholder text
-(UITextField*) makeTextField: (NSString*)text
                  placeholder: (NSString*)placeholder  ;

// Handles UIControlEventEditingDidEndOnExit
- (IBAction)textFieldFinished:(id)sender ;
@end
