//
//  SignUpViewController.m
//  Fight
//
//  Created by gilgameshvn on 12/6/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    [self showLoadingProgress:@selector(loadFormRegister)];
}
- (void) loadFormRegister
{
//    NSURL *websiteUrl = [NSURL URLWithString:SINGUP];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
//    [self.webViewRegister loadRequest:urlRequest];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showLoadingProgress:(SEL) selector
{
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    
    [HUD showWhileExecuting:selector onTarget:self withObject:nil animated:YES];
}

@end
