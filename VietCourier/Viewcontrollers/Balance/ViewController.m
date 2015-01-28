//
//  ViewController.m
//  Balance
//
//  Created by SonNV on 1/28/15.
//  Copyright (c) 2015 SonNV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ASFTableViewDelegate>

@property (nonatomic, retain) NSMutableArray *rowsArray;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _rowsArray = [[NSMutableArray alloc] init];
    
    NSArray *cols = @[@"Mã vận đơn",@"Tiền thu hộ",@"Trạng thái"];
    NSArray *weights = @[@(0.15f),@(0.15f),@(0.25f)];
    NSDictionary *options = @{kASF_OPTION_CELL_TEXT_FONT_SIZE : @(16),
                              kASF_OPTION_CELL_TEXT_FONT_BOLD : @(true),
                              kASF_OPTION_CELL_BORDER_COLOR : [UIColor blackColor], //lightGrayColor
                              kASF_OPTION_CELL_BORDER_SIZE : @(1.5),
                              kASF_OPTION_BACKGROUND : [UIColor colorWithRed:239/255.0 green:244/255.0 blue:254/255.0 alpha:1.0]};
    
    [_mASFTableView setDelegate:self];
    [_mASFTableView setBounces:NO];
    [_mASFTableView setSelectionColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0f]];
    [_mASFTableView setTitles:cols
                  WithWeights:weights
                  WithOptions:options
                    WitHeight:32 Floating:YES];
    
    [_rowsArray removeAllObjects];
    for (int i=0; i<25; i++) {
        [_rowsArray addObject:@{
                                kASF_ROW_ID :
                                    @(i),
                                
                                kASF_ROW_CELLS :
                                    @[@{kASF_CELL_TITLE : @"Sample ID", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentCenter)},
                                      @{kASF_CELL_TITLE : @"Sample Name", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentLeft)},
                                      @{kASF_CELL_TITLE : @"Sample Phone No.", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentCenter)}],
                                
                                kASF_ROW_OPTIONS :
                                    @{kASF_OPTION_BACKGROUND : [UIColor whiteColor],
                                      kASF_OPTION_CELL_PADDING : @(2),
                                      kASF_OPTION_CELL_BORDER_COLOR : [UIColor blackColor]},
                                
                                @"some_other_data" : @(123)}];
        
    }
    
    [_mASFTableView setRows:_rowsArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ASFTableViewDelegate
- (void)ASFTableView:(ASFTableView *)tableView DidSelectRow:(NSDictionary *)rowDict WithRowIndex:(NSUInteger)rowIndex {
    NSLog(@"%d", rowIndex);
}

@end


