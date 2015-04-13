//
//  addresBook.m
//  ShipMe
//
//  Created by SonNV on 4/13/15.
//  Copyright (c) 2015 VietCourier. All rights reserved.
//

#import "AddressBook.h"
static AddressBook *sharedAddressBookManager = nil;
@implementation AddressBook
-(id) init {
    self = [super init];
    if (self) {
        self.fullName = @"";
        self.phoneNumber = @"";
        self.homeNumber = @"";
        self.district = @"";
        self.district = @"";
        self.firstEmail = @"";
        self.secondEmail = @"";
        self.note = @"";
    }
    return self;
}
+ (AddressBook *)shareManager{
    if (sharedAddressBookManager == nil) {
        sharedAddressBookManager = [[super allocWithZone:NULL] init];
    }
    return sharedAddressBookManager;
}
//- (id)copyWithZone:(NSZone *)zone {
//    OfferDTO *copy = [[[self class] allocWithZone: zone] init];
//    [copy setOfferId:[self offerId]];
//    [copy setOfferName:[self offerName]];
//    [copy setOfferAddress:[self offerAddress]];
//    [copy setLogoId:[self logoId]];
//    [copy setLogoUrl:[self logoUrl]];
//    [copy setCagegoryId:[self cagegoryId]];
//    [copy setCategoryName:[self categoryName]];
//    [copy setOfferDescription:[self offerDescription]];
//    [copy setAvailableDate:[self availableDate]];
//    [copy setOfferLatitude:[self offerLatitude]];
//    [copy setOfferLongitude:[self offerLongitude]];
//    [copy setLike:[self like]];
//    [copy setDislike:[self dislike]];
//    [copy setLasttimeDisLike:[self lasttimeDisLike]];
//    [copy setOfferPublic:[self offerPublic]];
//    [copy setCreateBy:[self createBy]];
//    [copy setOfferStatus:[self offerStatus]];
//    [copy setLikeStatus:[self likeStatus]];
//    [copy setOfferURL:[self OfferURL]];
//    [copy setLogoImageId:[self logoImageId]];
//    [copy setOfferList:[self offerList]];
//    [copy setOfferItem:[self offerItem]];
//    [copy setOfferListOnPin:[self offerListOnPin]];
//    return copy;
//}

@end
