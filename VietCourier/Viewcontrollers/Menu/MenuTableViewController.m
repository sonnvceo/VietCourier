//
//  MenuTableViewController.m
//  ShipMe
//
//  Created by SonNV on 4/13/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuTableCell.h"
#import "AddressBookViewController.h"
@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
    float heightOfHeader = tableView.frame.size.height - 44*10 - 40*2;
    if (section!=0) {
        return 40.0;
    }
    else
        return heightOfHeader;

    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view;
    UIView *subView;
    UILabel *label;
    if (section!=0) {
         subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 40)];
        [subView setBackgroundColor:[UIColor colorWithRed:253/255.0f green:185/255.0f blue:44/255.0f alpha:1]];
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
        /* Create custom view to display section header... */
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 40)];
        [label setFont:[UIFont boldSystemFontOfSize:14]];
        [label setTextColor:[UIColor blackColor]];
        [view setBackgroundColor:[UIColor colorWithRed:218/255.0 green:218/255.0 blue:217/255.0 alpha:1.0]]; //your background color...
        [view addSubview:label];
        [view addSubview:subView];
    }
    else {
        float heightOfHeader = tableView.frame.size.height - 44*10 - 40*2;
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, heightOfHeader)];
        subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, heightOfHeader)];
        [subView setBackgroundColor:[UIColor colorWithRed:253/255.0f green:185/255.0f blue:44/255.0f alpha:1]];
        UIImageView *imgVAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(70, 0, 100, 100)];
        imgVAvatar.center = CGPointMake(70, view.frame.size.height/2);
        imgVAvatar.layer.cornerRadius = imgVAvatar.frame.size.width / 2;
        imgVAvatar.clipsToBounds = YES;
        imgVAvatar.layer.borderWidth = 5.0f;
        imgVAvatar.layer.borderColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:217/255.0 alpha:1.0].CGColor;
        [imgVAvatar setImage:[UIImage imageNamed:@"avatar.png"]];
        
        UILabel *labelWelcome = [[UILabel alloc] initWithFrame:CGRectMake(imgVAvatar.frame.origin.x + imgVAvatar.frame.size.width +10,
                                                          view.center.y-30, tableView.frame.size.width,
                                                          40)];
        [labelWelcome setFont:[UIFont boldSystemFontOfSize:13]];
        [labelWelcome setTextColor:[UIColor grayColor]];
        [labelWelcome setText:@"Xin chào"];
        label = [[UILabel alloc] initWithFrame:CGRectMake(imgVAvatar.frame.origin.x + imgVAvatar.frame.size.width +10,
                                                          view.center.y-10, tableView.frame.size.width,
                                                          40)];
        [label setFont:[UIFont boldSystemFontOfSize:20]];
        [label setTextColor:[UIColor blackColor]];
        [label setText:@"Shop NQT"];
        [view addSubview:labelWelcome];
        [view addSubview:label];
        [view addSubview:subView];
        [view addSubview:imgVAvatar];
        [self addBottomBorderForView:view WithColor:[UIColor colorWithRed:218/255.0 green:218/255.0 blue:217/255.0 alpha:1.0] andWidth:1];
    }
    switch (section) {
        case 0:
            break;
        case 1:
            [label setText:@"TÀI KHOẢN"];
            break;
        case 2:
            [label setText:@"HỖ TRỢ"];
            break;
        default:
            break;
    }
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MenuTableCell";
    MenuTableCell *cell = (MenuTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"MenuTableCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[MenuTableCell class]]) {
                cell = (MenuTableCell *) currentObject;
                break;
            }
        }
        cell.delegate = (id)self;
       [cell configureCell:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)addBottomBorderForView:(UIView*)view WithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    border.frame = CGRectMake(0, view.frame.size.height-1, view.frame.size.width, borderWidth);
    [view addSubview:border];
}
/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressBookViewController *addressBookViewController = [[AddressBookViewController alloc] initWithNibName:@"AddressBookViewController" bundle:nil];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row ) {
                case 0: {
                    
                    break ;
                }
                case 1: {
                    [[AppDelegate shareAppDelegate].stackViewController setContentViewController:addressBookViewController];
                    break ;
                }
                case 2: {
                    break ;
                }
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row ) {
                case 0: {

                    break ;
                }
                case 1: {

                    break ;
                }
                case 2: {

                    break ;
                }
                case 3: {

                    break ;
                }
                default:
                    break;
            }
            break;
        case 2:
            switch ( indexPath.row ) {
                case 0: {

                    break ;
                }
                case 1: {

                    break ;
                }
                case 2: {

                    break ;
                }
                default:
                    break;
            }
            break;
            
        default:
            break;
    }

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
