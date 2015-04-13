//
//  addresBook.h
//  ShipMe
//
//  Created by SonNV on 4/13/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBook : NSObject

@property (retain,nonatomic)  NSString *fullName;
@property (retain,nonatomic)  NSString *phoneNumber;
@property (retain,nonatomic)  NSString *homeNumber;
@property (retain,nonatomic)  NSString *district;
@property (retain,nonatomic)  NSString *city;
@property (retain,nonatomic)  NSString *firstEmail;
@property (retain,nonatomic)  NSString *secondEmail;
@property (retain,nonatomic)  NSString *note;

+ (AddressBook *)shareManager;
//- (id)copyWithZone:(NSZone *)zone;
@end
