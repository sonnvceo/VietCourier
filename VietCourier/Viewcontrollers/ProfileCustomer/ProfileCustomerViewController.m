//
//  ProfileCustomerViewController.m
//  VietCourier
//
//  Created by SonNV on 2/4/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "ProfileCustomerViewController.h"

@interface ProfileCustomerViewController ()

@end

@implementation ProfileCustomerViewController
@synthesize tableViewProfile,
 email,
 address,
 fullName,
 district,
 stringAddress,
 stringDistrict,
 stringEmail,
 stringFullname;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // Make cell unselectable
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITextField* tf = nil ;
    switch (indexPath.section ) {
        case 0: {
            switch (indexPath.row) {
                case 0: {
                    tf = fullNameField = [self makeTextField:stringFullname placeholder:@"Họ tên"];
                    [cell addSubview:fullNameField];
                    break;
                }
                case 1: {
                    cell.textLabel.text = @"0978811262" ;
                    break;
                }
                case 2: {
                    tf = emailField = [self makeTextField:stringEmail placeholder:@"Email"];
                    [cell addSubview:fullNameField];
                    break;
                }
                default:
                    break;
            }
            break ;
        }
        case 1: {
            switch (indexPath.row) {
                case 0: {
                    tf = addressField = [self makeTextField:stringAddress placeholder:@"Địa chỉ"];
                    [cell addSubview:fullNameField];
                    break;
                }
                case 1: {
                    tf = emailField = [self makeTextField:stringEmail placeholder:@"Quận / Huyện"];
                    [cell addSubview:fullNameField];
                    break;
                }
                case 2: {
                    cell.textLabel.text = @"Hà Nội" ;
                    break;
                }
                default:
                    break;
            }

            break ;
        }
    }
    
    // Textfield dimensions
    tf.frame = CGRectMake(20, 12, 170, 30);
    
    // Workaround to dismiss keyboard when Done/Return is tapped
    [tf addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    // We want to handle textFieldDidEndEditing
    tf.delegate = self ;
    
    return cell;
}
-(UITextField*) makeTextField: (NSString*)text
                  placeholder: (NSString*)placeholder  {
    UITextField *tf = [[UITextField alloc] init];
    tf.placeholder = placeholder ;
    tf.text = text ;
    tf.autocorrectionType = UITextAutocorrectionTypeNo ;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tf.adjustsFontSizeToFitWidth = YES;
    tf.textColor = [UIColor colorWithRed:56.0f/255.0f green:84.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
    return tf ;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if ( textField == emailField ) {
//        stringEmail = textField.text ;
//    } else if ( textField == passwordField ) {
//        stringPassword = textField.text ;
//    }
}

@end
