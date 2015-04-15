//
//  NetworkRequestManager.h
//  Weather
//
//  Created by Kloon on 1/14/15.
//  Copyright (c) 2015 Scott Sherwood. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, NRMDataType) {
    NRMDataTypeJson = 1 << 0,
    NRMDataTypePlist = 1 << 1,
    NRMDataTypeXML = 1 << 2,
    NRMDataTypeImage = 1 << 3,
};

@interface NetworkRequestManager : NSObject
@property (nonatomic, retain)AFHTTPRequestOperation *operation;
@property (nonatomic, retain)AFHTTPRequestOperationManager *manager;
@property(nonatomic, strong) id                 delegate;
@property(nonatomic) SEL                        callback;
@property(nonatomic) SEL					errorCallback;
+(NetworkRequestManager*)shareInstance;
- (BOOL)connected;

- (void)getRequestDataWithURL:(NSString*)urlString type:(NSUInteger)type completion:(void(^)(id dataResults, NSError *error))completion;

- (void)manageRequestDataWithURL:(NSString*)urlString method:(NSString*)strMethod type:(NSUInteger)type completion:(void(^)(id dataResults, NSError *error))completion;

- (void)getRequestDataJsonWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
- (void)getRequestDataPlistWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
- (void)getRequestDataXMLWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
- (void)getRequestDataImageWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;

- (void)postRequestDataJsonWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
- (void)postRequestDataPlistWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
- (void)postRequestDataXMLWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
- (void)postRequestDataImageWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion;
// Download from url
- (void)downloadFromURL:(NSString*)strURl;
- (void)uploadTaskToURL:(NSString*)strURL;
- (NSString *)getUserIdURL;
- (NSString *)searchOffersURL;
- (NSString *)addOfferURL;
- (void)getServerInfoForGetUserId:(NSString *)adId WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
/*
- (void)getServerInfoForSearchOffers:(CLLocationCoordinate2D)coordinateTopLeft coordinateBottomRight:(CLLocationCoordinate2D)coordinateBottomRigh WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerSubCategoriesFromParentCat:(CategoryDTO*)parentCat WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerSubCategoriesFromCurrentCat:(CategoryDTO*)currentCat WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerInfoForAddOfferWithOfferName:(NSString*)offername WithAddress:(NSString*)address WithCategoryId:(NSString*)categoryid WithLat:(NSString*)latitude WithLong:(NSString*)longitude WithPublic:(NSString*)public WithDesctiprion:(NSString*)description WithAvailableDate:(NSString*)availabledate WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerInfoForUploadImageWithLocalName:(NSString*)localName WithDataImage:(NSURL*)dataImage WithOfferId:(NSString*)offerId WithDelegate:(id)Delegate WithSelector:(SEL)CallBack WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerInfoForUpdateOfferWithOfferId:(NSString*)offerId WithOfferName:(NSString*)offername WithAddress:(NSString*)address WithCategoryId:(NSString*)categoryid WithLat:(NSString*)latitude WithLong:(NSString*)longitude WithPublic:(NSString*)public WithDesctiprion:(NSString*)description WithAvailableDate:(NSString*)availabledate WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerInfoForOrganizeMediaWithOfferId:(NSString*)offerId WithImageOrder:(NSString*)imageOrder WithLogoId:(NSString*)logoId WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerDetailOffer:(NSString*)offerID WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerLikeOffer:(NSString*)offerID  WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerDisLikeOffer:(NSString*)offerID  WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerMyOfferWithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
- (void)getServerDeleteOffer:(NSString*)offerID WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector;
 */
@end
