//
//  EventTableCell.m
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import "MenuTableCell.h"

@implementation MenuTableCell
@synthesize imgLogo,
lblTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) configureCell:(NSIndexPath*) indexPath {
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row ) {
                case 0: {
                    [self setImageLogo:@"ico_vandon.png" withTitle:@"QUẢN LÝ VẬN ĐƠN"];
                    break ;
                }
                case 1: {
                    [self setImageLogo:@"ico_lienlac.png" withTitle:@"SỔ ĐỊA CHỈ"];
                    break ;
                }
                case 2: {
                    [self setImageLogo:@"ico_tinhcuoc.png" withTitle:@"TÍNH CƯỚC"];
                    break ;
                }
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row ) {
                case 0: {
                    [self setImageLogo:@"ico_taikhoan.png" withTitle:@"TRANG CÁ NHÂN"];
                    break ;
                }
                case 1: {
                    [self setImageLogo:@"ico_giaodich.png" withTitle:@"THÔNG TIN GIAO DỊCH"];
                    break ;
                }
                case 2: {
                    [self setImageLogo:@"ico_lichsu.png" withTitle:@"LỊCH SỬ CHUYỂN KHOẢN"];
                    break ;
                }
                case 3: {
                    [self setImageLogo:@"ico_khuyenmail.png" withTitle:@"KHUYẾN MẠI"];
                    break ;
                }
                default:
                    break;
            }
            break;
        case 2:
            switch ( indexPath.row ) {
                case 0: {
                     [self setImageLogo:@"ico_tongdai.png" withTitle:@"TỔNG ĐÀI"];
                    break ;
                }
                case 1: {
                     [self setImageLogo:@"ico_thanphien.png" withTitle:@"THAN PHIỀN"];
                    break ;
                }
                case 2: {
                    [self setImageLogo:@"ico_dangxuat.png" withTitle:@"MORE INFO"];
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
- (void) setImageLogo:(NSString*) imageName withTitle:(NSString*) stringTitle {
    [imgLogo setImage:[UIImage imageNamed:imageName]];
    [lblTitle setText:stringTitle];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
