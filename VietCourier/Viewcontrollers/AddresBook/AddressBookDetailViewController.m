//
//  AddressBookViewController.m
//  ShipMe
//
//  Created by SonNV on 4/13/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "AddressBookDetailViewController.h"
#import "AddressBook.h"
@interface AddressBookDetailViewController ()

@end

@implementation AddressBookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // create a rect for the text view so it's the right size coming out of IB. Size it to something that is form fitting to the string in the model.
//    textViewNote.contentSize = CGSizeMake(self.tableViewAddress.frame.size.width, [self heightForTextView:textViewNote containingString:self.model]);
    textViewNote = [[UITextView alloc] init];
}
- (CGFloat)heightForTextView:(UITextView*)textView containingString:(NSString*)string
{
    float horizontalPadding = 24;
    float verticalPadding = 16;
    float widthOfTextView = textView.contentSize.width - horizontalPadding;
    float height = [string sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(widthOfTextView, 999999.0f) lineBreakMode:NSLineBreakByWordWrapping].height + verticalPadding;
    
    return height;
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
- (void) viewDidLayoutSubviews {
    CGRect textViewRect = CGRectMake(0, 0, self.tableViewAddress.frame.size.width, 200);
    textViewNote.frame = textViewRect;
}
#pragma mark -
#pragma mark Table view data source
- (BOOL) allowsHeaderViewsToFloat {
    return NO;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 30)];
    [label setFont:[UIFont boldSystemFontOfSize:14]];
    [label setTextColor:[UIColor whiteColor]];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:160/255.0 green:212/255.0 blue:231/255.0 alpha:1.0]]; //your background color...
    switch (section) {
        case 0:
            [label setText:@"Thông tin cá nhân"];
            break;
        case 1:
            [label setText:@"Địa chỉ"];
            break;
        case 2:
            [label setText:@"Địa chủ Email"];
            break;
        case 3:
            [label setText:@"Ghi chú"];
            break;
        default:
            break;
    }
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3 && indexPath.row == 0) {
        return 200;
    }
    else {
        return self.tableViewAddress.rowHeight;
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
    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,250,30)]; //put in the frame variables you desire
    subLabel.textAlignment = NSTextAlignmentRight;
    subLabel.center = CGPointMake(0, cell.frame.size.height/2);
    [cell.contentView addSubview:subLabel];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row ) {
                case 0: {
                    subLabel.text = @"Họ Tên - " ;
                    tf = fullNameField = [self makeTextField:[AddressBook shareManager].fullName placeholder:@""];
                    [cell addSubview:fullNameField];
                    break ;
                }
                case 1: {
                    subLabel.text = @"Phone - " ;
                    tf = phoneNumberField = [self makeTextField:[AddressBook shareManager].phoneNumber placeholder:@""];
                    [cell addSubview:phoneNumberField];
                    break ;
                }
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row ) {
                case 0: {
                    subLabel.text = @"Số nhà - " ;
                    tf = homeNumberField = [self makeTextField:[AddressBook shareManager].homeNumber placeholder:@""];
                    [cell addSubview:homeNumberField];
                    break ;
                }
                case 1: {
                    subLabel.text = @"Quận - " ;
                    tf = districtField = [self makeTextField:[AddressBook shareManager].district placeholder:@""];
                    [cell addSubview:districtField];
                    break ;
                }
                case 2: {
                    subLabel.text = @"Thành Phố - " ;
                    tf = cityField = [self makeTextField:[AddressBook shareManager].city placeholder:@""];
                    [cell addSubview:cityField];
                    break ;
                }
                default:
                    break;
            }
            break;
        case 2:
            switch ( indexPath.row ) {
                case 0: {
                    subLabel.text = @"Email 1 - " ;
                    tf = firstEmailField = [self makeTextField:[AddressBook shareManager].firstEmail placeholder:@""];
                    [cell addSubview:firstEmailField];
                    break ;
                }
                case 1: {
                    subLabel.text = @"Email 2 - " ;
                    tf = secondEmailField = [self makeTextField:[AddressBook shareManager].secondEmail placeholder:@""];
                    [cell addSubview:secondEmailField];
                    break ;
                }
                default:
                    break;
            }
            break;
        case 3:
            [cell addSubview:textViewNote];
            textViewNote.delegate=self;
            break;
        default:
            break;
    }
    if (indexPath.section != 3 || indexPath.row != 0) {
        // Textfield dimensions
        tf.frame = CGRectMake(220, 0, 170, 30);
        tf.center = CGPointMake(220, cell.frame.size.height/2);
        // Workaround to dismiss keyboard when Done/Return is tapped
        [tf addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
        // We want to handle textFieldDidEndEditing
        tf.delegate = self ;
    }
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
    tf.textColor = [UIColor blackColor];
    return tf ;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ( textField == fullNameField ) {

    } else if ( textField == phoneNumberField ) {
 
    }
}
#pragma UITextViewDelegate
- (void) textViewDidChange:(UITextView *)textView {
    
}
@end
