//
//  LoginViewController.m
//  Fight
//
//  Created by gilgameshvn on 12/6/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "LoginViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "SignUpViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize tableLogin, stringEmail, stringPassword;
@synthesize btnLogin,email,password,btnSignUp,btnForgotPass;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.lableLogo.center = CGPointMake(self.view.center.x, 150);
    self.imgViewLogo.center = CGPointMake(self.view.center.x, 80);
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    self.lableLogo.center = CGPointMake(self.view.center.x, 150);
    self.imgViewLogo.center = CGPointMake(self.view.center.x, 80);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL) checkIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

-(void) postLogin
{
//    NSString *string= [NSString stringWithFormat:@"http://vcourier.elasticbeanstalk.com/v1/customers"];
//    NSURL *url = [NSURL URLWithString:string];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    NSString *username = @"a";
//    NSString *pass = @"a";
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:username forHTTPHeaderField:@"userName"];
//    [request setValue:pass forHTTPHeaderField:@"password"];
//    NSURLResponse *response;
//    NSError *err;
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
//    NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];

    NSString *URL_REGISTER = @"http://54.65.5.166:8080/v1/customers";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"userName" : @"sonnv", @"password" : @"123"};

    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"JSON: %@", responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];

/* sonnv
    NSString *username = email.text;
    NSString *pass = [self md5:password.text];
    NSString *pingJson = [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:LOGIN,username,pass]] encoding:NSUTF8StringEncoding error:nil];
    NSString *status22 = [[pingJson JSONValue]objectForKey:@"message"];
    NSString *tue = status22;
    if ([tue isEqualToString:@"OK"])
    {
         NSString *token    = [[[[pingJson JSONValue] objectForKey:@"data"] objectForKey:@"User"] objectForKey:@"token"];
        [self saveInfoSingin:tue andToken:token];
        
        AccountViewController *h = [[AccountViewController alloc]initWithNibName:@"AccountViewController" bundle:nil];
        //[delegate showTabar];
        [self.navigationController setNavigationBarHidden:NO];
        if (self.isGoldLive == YES) {
            [self.navigationController popToRootViewControllerAnimated:YES];
            delegate = nil;
        }
        else
        {
            [self.navigationController pushViewController:h animated:YES];
        }
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Login Fail please check username or password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        });
    }
*/
}
-(IBAction)btnLogin:(id)sender{
//    NSInteger error = 0;
//    NSString *message = @"Please enter email";
//    if (email.text.length == 0) {
//        error = 1;
//    }else if(password.text.length == 0)
//    {
//        error = 1;
//        message = @"Please enter password";
//    }else
//    {
//        if ([self checkIsValidEmail:email.text]) {
//            error = 1;
//            message = @"Invalidate Email";
//        }
//    }
//    
//    if (error == 1) {
//        [[[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
//    }else
//    {
//        [self showLoadingProgress:@selector(postLogin)];
//    }
//    [email resignFirstResponder];
//    [password resignFirstResponder];
    [self postLogin];
}
-(IBAction)btnSignUp:(id)sender{
    SignUpViewController *signUp = [[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:signUp animated:YES];
}
-(IBAction)btnForgotPass:(id)sender{}
-(void)dismiss:(id)sender
{
    [self.view endEditing:YES];
}

- (void)saveInfoSingin:(NSString*) status andToken:(NSString*) token
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:status forKey:@"status"];
    [defaults setObject:token forKey:@"token"];
    [defaults synchronize];
}
- (void)showLoadingProgress:(SEL) selector
{
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    
    [HUD showWhileExecuting:selector onTarget:self withObject:nil animated:YES];
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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // Make cell unselectable
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITextField* tf = nil ;
    switch ( indexPath.row ) {
        case 0: {
            cell.textLabel.text = @"vCourierID" ;
            tf = emailField = [self makeTextField:stringEmail placeholder:@"hdx@vietcourier.vn"];
            [cell addSubview:emailField];
            break ;
        }
        case 1: {
            cell.textLabel.text = @"Password" ;
            tf = passwordField = [self makeTextField:stringPassword placeholder:@"******"];
            [cell addSubview:passwordField];
            break ;
        }
    }
    
    // Textfield dimensions
    tf.frame = CGRectMake(120, 12, 170, 30);
    
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
    if ( textField == emailField ) {
        stringEmail = textField.text ;
    } else if ( textField == passwordField ) {
        stringPassword = textField.text ;
    }
}
@end
