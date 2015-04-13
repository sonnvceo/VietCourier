//
//  AddressBookViewController.h
//  ShipMe
//
//  Created by SonNV on 4/13/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressBookViewController : UIViewController <UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource, UITextViewDelegate> {
    UITextField* fullNameField;
    UITextField* phoneNumberField;
    UITextField* homeNumberField;
    UITextField* districtField;
    UITextField* cityField;
    UITextField* firstEmailField;
    UITextField* secondEmailField;
    UITextView *textViewNote;
}
-(UITextField*) makeTextField: (NSString*)text
                  placeholder: (NSString*)placeholder  ;
// Handles UIControlEventEditingDidEndOnExit
- (IBAction)textFieldFinished:(id)sender ;
@property (nonatomic, strong) IBOutlet UITableView *tableViewAddress;
@end
