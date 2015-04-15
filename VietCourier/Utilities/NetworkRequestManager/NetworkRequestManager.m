//
//  NetworkRequestManager.m
//  Weather
//
//  Created by Kloon on 1/14/15.
//  Copyright (c) 2015 Scott Sherwood. All rights reserved.
//

#import "NetworkRequestManager.h"

@implementation NetworkRequestManager
@synthesize operation;
@synthesize manager;
@synthesize delegate = _delegate;
@synthesize callback = _callback;
@synthesize errorCallback = _errorCallback;
static NetworkRequestManager *shareInstance_ = nil;

- (id) init
{
  if (self = [super init])
  {
    _delegate = nil;
    _callback = nil;
  }
  return self;
}

//init NetworkRequestManager
+(NetworkRequestManager*)shareInstance
{
    @synchronized(self) {
        if (!shareInstance_) {
            shareInstance_ = [[NetworkRequestManager alloc] init];
        }
    }
    return shareInstance_;
}

// Check internet connection
- (BOOL)connected
{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

- (void)getRequestDataWithURL:(NSString*)urlString type:(NSUInteger)type completion:(void(^)(id dataResults, NSError *error))completion
{
    AFHTTPRequestSerializer *_manager = [[AFHTTPRequestSerializer alloc] init];
    NSMutableURLRequest *request = [_manager requestWithMethod:@"GET" URLString:urlString parameters:nil error:nil];
    [request setTimeoutInterval:30];
    
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    switch (type) {
        case NRMDataTypeJson:
            operation.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case NRMDataTypePlist:
            operation.responseSerializer = [AFPropertyListResponseSerializer serializer];
            break;
        case NRMDataTypeXML:
            operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case NRMDataTypeImage:
            operation.responseSerializer = [AFImageResponseSerializer serializer];
            break;
        default:
            operation.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
    }
    //set https
    operation.securityPolicy.allowInvalidCertificates = YES;
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            completion (responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion (nil, error ? error : [NSError errorWithDomain:@"Request Error" code:-104 userInfo:nil]);
        }
    }];
    
    [operation start];
}

- (void)manageRequestDataWithURL:(NSString*)urlString method:(NSString*)strMethod type:(NSUInteger)type completion:(void(^)(id dataResults, NSError *error))completion
{
    manager = [AFHTTPRequestOperationManager manager];
    //set https
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer.timeoutInterval = 60;
    
    /*
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 60.0;
    AFHTTPSessionManager* manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
    manager.securityPolicy.allowInvalidCertificates = YES;
    */
    
    switch (type) {
        case NRMDataTypeJson:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case NRMDataTypePlist:
            manager.responseSerializer = [AFPropertyListResponseSerializer serializer];
            break;
        case NRMDataTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case NRMDataTypeImage:
            manager.responseSerializer = [AFImageResponseSerializer serializer];
            break;
        default:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
    }
    
    if ([strMethod isEqualToString:@"GET"]) {
        [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (completion) {
                completion(responseObject, nil);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (completion) {
                completion (nil, error ? error : [NSError errorWithDomain:@"Request Error" code:-104 userInfo:nil]);
            }
        }];
        
        /*
        [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            if (completion) {
                completion(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (completion) {
                completion (nil, error ? error : [NSError errorWithDomain:@"Request Error" code:-104 userInfo:nil]);
            }
        }];
         */
    }
    else {
        [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (completion) {
                completion(responseObject, nil);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (completion) {
                completion (nil, error ? error : [NSError errorWithDomain:@"Request Error" code:-104 userInfo:nil]);
            }
        }];
        /*
        [manager POST:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            if (completion) {
                completion(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (completion) {
                completion (nil, error ? error : [NSError errorWithDomain:@"Request Error" code:-104 userInfo:nil]);
            }
        }];
         */
    }
}

- (void)getRequestDataJsonWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypeJson completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        [self manageRequestDataWithURL:urlString method:@"GET" type:NRMDataTypeJson completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)getRequestDataPlistWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypePlist completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"GET" type:NRMDataTypePlist completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)getRequestDataXMLWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypeXML completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"GET" type:NRMDataTypeXML completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)getRequestDataImageWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypeImage completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"GET" type:NRMDataTypeImage completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)postRequestDataJsonWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypeJson completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"POST" type:NRMDataTypeJson completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)postRequestDataPlistWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypePlist completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"POST" type:NRMDataTypePlist completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)postRequestDataXMLWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypeXML completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"POST" type:NRMDataTypeXML completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)postRequestDataImageWithURL:(NSString*)urlString completion:(void(^)(id dataResults, NSError *error))completion
{
    if (completion) {
//        [self getRequestDataWithURL:urlString type:NRMDataTypeImage completion:^(id dataResults, NSError *error) {
//            completion (dataResults, error);
//        }];
        
        [self manageRequestDataWithURL:urlString method:@"POST" type:NRMDataTypeImage completion:^(id dataResults, NSError *error) {
            completion (dataResults, error);
        }];
    }
}

- (void)testRequest
{
    AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    _manager.securityPolicy.allowInvalidCertificates = YES;
    _manager.requestSerializer.timeoutInterval = 60;
    
    NSDictionary *params = @ {@"user" :@"phongnv", @"pwd" :@"phongnv" };
    
    [_manager POST:@"url login" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    [_manager.operationQueue cancelAllOperations];
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)URLString
                                parameters:(NSDictionary *)parameters
{
    AFHTTPRequestSerializer *_requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    _requestSerializer.timeoutInterval = 60;
    NSMutableURLRequest *request = [_requestSerializer requestWithMethod:method URLString:URLString parameters:nil error:nil];
    [request setTimeoutInterval:60];
    
    return request;
}

- (void)downloadFromURL:(NSString*)strURl
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *_manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
    NSURL *URL = [NSURL URLWithString:strURl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [_manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

- (void)uploadTaskToURL:(NSString*)strURL
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *_manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    NSURLSessionUploadTask *uploadTask = [_manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}
/*
#pragma mark - server IPA
- (NSString *)getUserIdURL {
  return([NSString stringWithFormat:@"%@get_user_id", SERVER_API]);
}

- (NSString *)searchOffersURL {
  return([NSString stringWithFormat:@"%@search_offers", SERVER_API]);
}

- (NSString *)addOfferURL {
  return([NSString stringWithFormat:@"%@add_offer", SERVER_API]);
}

#pragma mark - get user id handling
- (void)getServerInfoForGetUserId:(NSString *)adId WithDelegate:(id)Delegate WithSelector:(SEL)CallBack WithErrorSelector:(SEL)requestErrorSelector {
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
  NSString *string = [NSString stringWithFormat:@"%@?lang=en&version=1.0", [self getUserIdURL]];
  AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
  _manager.requestSerializer.timeoutInterval = 30;
  NSDictionary *parameters = @{@"device_id":[DeviceDTO shareManager].deviceId};
  [_manager POST:string parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"JSON: %@", responseObject);
    NSDictionary *jsonData = [responseObject objectForKey:@"data"];
    NSString *userId = [jsonData objectForKey:@"user_id"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:userId forKey:@"user_id"];
    [userDefault synchronize];
    [DeviceDTO shareManager].userId = userId;
    // call method search off in class OfferViewController
    if(_delegate && _callback)
      if([_delegate respondsToSelector:_callback]) {
        [_delegate performSelector:_callback withObject:nil];
      } else {
//        NSLog(@"No response from delegate");
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    if(_errorCallback) {
      [_delegate performSelector:_errorCallback withObject:nil];
    }
  }];
}

#pragma mark - search offer handling
- (void)getServerInfoForSearchOffers:(CLLocationCoordinate2D)coordinateTopLeft coordinateBottomRight:(CLLocationCoordinate2D)coordinateBottomRight WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector{
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
  NSString *string = [NSString stringWithFormat:@"%@?device_id=%@&lang=en&version=1.0", [self searchOffersURL], [DeviceDTO shareManager].deviceId];
  NSString *latitudeParam = [[NSString alloc] initWithFormat:@"%f", coordinateTopLeft.latitude];
  NSString *longitudeParam = [[NSString alloc] initWithFormat:@"%f", coordinateTopLeft.longitude];
  NSString *deltaLat = [[NSString alloc] initWithFormat:@"%f", fabsf(coordinateTopLeft.latitude -coordinateBottomRight.latitude)];
  NSString *deltaLong = [[NSString alloc] initWithFormat:@"%f", fabsf(coordinateTopLeft.longitude -coordinateBottomRight.longitude)];
  NSString *stringCatIDs = [CategoryDTO shareManager].stringCatIdsToSend;
    if (stringCatIDs.length>0)
        stringCatIDs= [stringCatIDs substringToIndex:[stringCatIDs length]-1];
    else
        stringCatIDs = @"";
  AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
  _manager.requestSerializer.timeoutInterval = 30;
  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:latitudeParam, @"lat", longitudeParam, @"long", deltaLat, @"delta_lat", deltaLong, @"delta_long", [DeviceDTO shareManager].userId, @"user_id", stringCatIDs, @"cat_ids", nil];
//  NSLog(@"request search_offers: %@ == %@", string, parameters);
  [_manager POST:string parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSArray *listOffer = [responseObject objectForKey:@"data"];
    [[OfferDTO shareManager] saveOffersList:listOffer];
//    NSLog(@"offer list count %ld", [[OfferDTO shareManager].offerList count]);
    // call method search off in class OfferViewController
    if(_delegate && _callback)
      if([_delegate respondsToSelector:_callback]) {
        [_delegate performSelector:_callback withObject:nil];
      } else {
        if(_errorCallback) {
          [_delegate performSelector:_errorCallback withObject:nil];
        }
      }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    if(_errorCallback) {
      [_delegate performSelector:_errorCallback withObject:nil];
    }
  }];
}
#pragma mark -
- (void)getServerSubCategoriesFromParentCat:(CategoryDTO*)parentCat WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
    _delegate = Delegate;
    _callback = CallBack ;
    _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kSUB_CATEGORIES_LIST,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *currentParentID = parentCat?[NSString stringWithFormat:@"%d",parentCat.categoryId]:@"0";
    NSDictionary *params = @ {kPARENT_ID : currentParentID};
    
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSArray *arrayObject = [responseObject objectForKey:@"data"];
              [[CategoryDTO shareManager] saveCategoriesList:arrayObject];
              //
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback]) {
                      [_delegate performSelector:_callback withObject:currentParentID];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:nil];
              }
          }];
}
- (void)getServerSubCategoriesFromCurrentCat:(CategoryDTO*)currentCat WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kCURRENT_CATEGORIES_LIST,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *currentParentID = currentCat?[NSString stringWithFormat:@"%d",currentCat.categoryId]:@"0";
    NSDictionary *params = @ {kCATEGORY_ID : currentParentID};
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *currentParentIDCat = ![[responseObject objectForKey:@"parent_id"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"parent_id"] : @"";
            NSString *currentParentNameCat = ![[responseObject objectForKey:@"parent_name"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"parent_name"] : @"";
            NSArray *arrayObject = [responseObject objectForKey:@"data"];
            [[CategoryDTO shareManager] saveCategoriesList:arrayObject];
            CategoryDTO *categoryPar = [[CategoryDTO alloc] init];
            categoryPar.categoryId = [currentParentIDCat intValue];;
            categoryPar.categoryName = currentParentNameCat;
            [[CategoryDTO shareManager] saveCategoryParent:categoryPar];
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback]) {
                      [_delegate performSelector:_callback withObject:currentParentIDCat];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:nil];
              }
          }];
}

#pragma mark - add offer handling
- (void)getServerInfoForAddOfferWithOfferName:(NSString*)offername WithAddress:(NSString*)address WithCategoryId:(NSString*)categoryid WithLat:(NSString*)latitude WithLong:(NSString*)longitude WithPublic:(NSString*)public WithDesctiprion:(NSString*)description WithAvailableDate:(NSString*)availabledate WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector{
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
  NSString *string = [NSString stringWithFormat:@"%@?device_id=%@&lang=en&version=1.0", [self addOfferURL], [DeviceDTO shareManager].deviceId];
  AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
  _manager.requestSerializer.timeoutInterval = 30;
  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:offername, @"name", address, @"address", categoryid, @"category_id", latitude, @"lat", longitude, @"long", public, @"public", description, @"description", availabledate, @"available_date", [DeviceDTO shareManager].userId, @"created_by", nil];
  //  NSLog(@"request search_offers: %@ == %@", string, parameters);
  [_manager POST:string parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"JSON: %@", responseObject);
    NSString *status = [responseObject objectForKey:@"status"];
    if (![status isEqualToString:@"ok"]) {
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
      return;
    }
    // check offer id
    NSString *offerId = ![[responseObject objectForKey:@"offer_id"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"offer_id"] : @"";
    if ([offerId isEqual:@""]) {
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
      return;
    }
    //
    if([_delegate respondsToSelector:_callback]) {
      [_delegate performSelector:_callback withObject:offerId];
    } else {
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
        id json;
        NSData *data;
        if (operation.responseString)
            data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
            if(error.code == kCFURLErrorBadServerResponse) {
                json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                [_delegate performSelector:_errorCallback withObject:json];
            }
            else {
                [_delegate performSelector:_errorCallback withObject:OTHER_CODE];
            }
        }
        else {
          [_delegate performSelector:_errorCallback withObject:nil];
        }
  }];
}

#pragma mark - update offer handling
- (void)getServerInfoForUpdateOfferWithOfferId:(NSString*)offerId WithOfferName:(NSString*)offername WithAddress:(NSString*)address WithCategoryId:(NSString*)categoryid WithLat:(NSString*)latitude WithLong:(NSString*)longitude WithPublic:(NSString*)public WithDesctiprion:(NSString*)description WithAvailableDate:(NSString*)availabledate WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector{
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
  NSString *string = [NSString stringWithFormat:@"%@%@?device_id=%@&lang=en&version=1.0", SERVER_API, kUPDATE_OFFER, [DeviceDTO shareManager].deviceId];
  AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
  _manager.requestSerializer.timeoutInterval = 30;
//  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:offerId, "offer_id", offername, @"name", address, @"address", categoryid, @"category_id", latitude, @"lat", longitude, @"long", public, @"public", description, @"description", availabledate, @"available_date", [DeviceDTO shareManager].userId, @"created_by", nil];
  
  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:offerId, @"offer_id", [DeviceDTO shareManager].userId, @"created_by", offername, @"name", address, @"address", categoryid, @"category_id", latitude, @"lat", longitude, @"long", public, @"public", description, @"description", availabledate, @"available_date", nil];
  [_manager POST:string parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSString *status = [responseObject objectForKey:@"status"];
    if (![status isEqualToString:@"ok"]) {
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
      return;
    }
    //
    if([_delegate respondsToSelector:_callback]) {
      [_delegate performSelector:_callback withObject:offerId];
    } else {
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      id json;
      NSData *data;
      if (operation.responseString)
          data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
      if (data)
          json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
      if(_errorCallback) {
          [_delegate performSelector:_errorCallback withObject:json?json:nil];
      }
  }];
}

#pragma mark - updaload image handling
- (void)getServerInfoForUploadImageWithLocalName:(NSString*)localName WithDataImage:(NSURL*)dataImage WithOfferId:(NSString*)offerId WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector{
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
//  NSString *string = [NSString stringWithFormat:@"%@%@?device_id=%@&lang=en&version=1.0", SERVER_API, kUPLOAD_IMAGE, [DeviceDTO shareManager].deviceId];
//  AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
//  _manager.requestSerializer.timeoutInterval = 30;
//  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:offerId, @"offer_id", localName, @"local_name", dataImage, @"data_image", nil];
//  [_manager POST:string parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"JSON: %@", responseObject);
//    NSString *status = [responseObject objectForKey:@"status"];
//    if (![status isEqualToString:@"ok"]) {
//      if(_errorCallback) {
//        [_delegate performSelector:_errorCallback withObject:nil];
//      }
//      return;
//    }
//    NSString *imageId = ![[responseObject objectForKey:@"image_id"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"image_id"] : @"";
//    NSString *imageLocalName = ![[responseObject objectForKey:@"local_name"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"local_name"] : @"";
//    if ([imageId isEqualToString:@""] || [imageLocalName isEqualToString:@""]) {
//      if(_errorCallback) {
//        [_delegate performSelector:_errorCallback withObject:nil];
//      }
//      return;
//    }
//    //
//    if([_delegate respondsToSelector:_callback]) {
//      [_delegate performSelector:_callback withObject:responseObject];
//    } else {
//      if(_errorCallback) {
//        [_delegate performSelector:_errorCallback withObject:nil];
//      }
//    }
//  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    NSLog(@"Error: %@", error);
//    if(_errorCallback) {
//      [_delegate performSelector:_errorCallback withObject:nil];
//    }
//  }];
  
  NSString *strServer = [NSString stringWithFormat:@"%@%@?device_id=%@&lang=en&version=1.0", SERVER_API, kUPLOAD_IMAGE, [DeviceDTO shareManager].deviceId];
  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:offerId, @"offer_id", localName, @"local_name", nil];
  NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:strServer parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileURL:dataImage name:@"data_image" fileName:localName mimeType:@"multipart/form-data" error:nil];
  } error:nil];
  
  AFURLSessionManager *_manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
  NSProgress *progress = nil;
  
  NSURLSessionUploadTask *uploadTask = [_manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
    if (error) {
      NSLog(@"Error: %@", error);
      if (responseObject) {
//        NSLog(@"response: %@",responseObject);
          if(_errorCallback) {
              [_delegate performSelector:_errorCallback withObject:responseObject];
          }
      }
      else {
          if(_errorCallback) {
            [_delegate performSelector:_errorCallback withObject:nil];
          }
      }
    } else {
//      NSLog(@"%@ %@", response, responseObject);
      NSString *status = [responseObject objectForKey:@"status"];
      if (![status isEqualToString:@"ok"]) {
        if(_errorCallback) {
          [_delegate performSelector:_errorCallback withObject:nil];
        }
        return;
      }
      NSString *imageId = [NSString stringWithFormat:@"%@", ![[responseObject objectForKey:@"image_id"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"image_id"] : @""];
      NSString *imageLocalName = [NSString stringWithFormat:@"%@", ![[responseObject objectForKey:@"local_name"] isKindOfClass:[NSNull class]] ? [responseObject objectForKey:@"local_name"] : @""];
      if ([imageId isEqualToString:@""] || [imageLocalName isEqualToString:@""]) {
        if(_errorCallback) {
          [_delegate performSelector:_errorCallback withObject:nil];
        }
        return;
      }
      //
      if([_delegate respondsToSelector:_callback]) {
        [_delegate performSelector:_callback withObject:responseObject];
      } else {
        if(_errorCallback) {
          [_delegate performSelector:_errorCallback withObject:nil];
        }
      }
    }
  }];
  
  [uploadTask resume];
}

#pragma mark - organize media handling
- (void)getServerInfoForOrganizeMediaWithOfferId:(NSString*)offerId WithImageOrder:(NSString*)imageOrder WithLogoId:(NSString*)logoId WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector{
  _delegate = Delegate;
  _callback = CallBack ;
  _errorCallback = requestErrorSelector;
  NSString *string = [NSString stringWithFormat:@"%@%@?device_id=%@&lang=en&version=1.0", SERVER_API, kORGANIZE_MEDIA, [DeviceDTO shareManager].deviceId];
  AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
  _manager.requestSerializer.timeoutInterval = 30;
  NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:offerId, @"offer_id", imageOrder, @"images_order", logoId, @"logo_id", nil];
  [_manager POST:string parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"JSON: %@", responseObject);
    NSString *status = [responseObject objectForKey:@"status"];
    if (![status isEqualToString:@"ok"]) {
        if (responseObject) {
            //        NSLog(@"response: %@",responseObject);
            if(_errorCallback) {
                [_delegate performSelector:_errorCallback withObject:responseObject];
            }
        }
        else {
            if(_errorCallback) {
                [_delegate performSelector:_errorCallback withObject:nil];
            }
        }
    }
    if([_delegate respondsToSelector:_callback]) {
      [_delegate performSelector:_callback withObject:nil];
    } else {
      if(_errorCallback) {
        [_delegate performSelector:_errorCallback withObject:nil];
      }
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    if(_errorCallback) {
      [_delegate performSelector:_errorCallback withObject:nil];
    }
  }];
}
#pragma mark - offer detail handling
- (void)getServerDetailOffer:(NSString*)offerID WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
    _delegate = Delegate;
    _callback = CallBack ;
    _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kOFFER_DETAIL,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *userID = [NSString stringWithFormat:@"%@",[DeviceDTO shareManager].userId];
    NSDictionary *params = @ {kOFFER_ID : offerID, kUSER_ID : userID};
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSDictionary *dictOffer = [responseObject objectForKey:@"data"];
              [[OfferDTO shareManager] saveOffer:dictOffer];
            NSArray *imageList = [dictOffer objectForKey:@"images"];
            [[ImageDTO shareManager] saveImagesOfferDetail:imageList];
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback]) {
                      [_delegate performSelector:_callback withObject:nil];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              id json;
              NSData *data;
              if (operation.responseString)
                  data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              if (data)
                  json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:json?json:nil];
              }
          }];
}
- (void)getServerLikeOffer:(NSString*)offerID  WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
    _delegate = Delegate;
    _callback = CallBack ;
    _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kLIKE_OFFER,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *userID = [NSString stringWithFormat:@"%@",[DeviceDTO shareManager].userId];
    NSDictionary *params = @ {kOFFER_ID : offerID, kUSER_ID : userID};
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSString *status = [responseObject objectForKey:@"status"];
              NSDictionary *dictOffer = [responseObject objectForKey:@"data"];
              if ([status isEqualToString:@"ok"]) {
                  [[OfferDTO shareManager] saveLikeOffer:dictOffer];
              }
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback]) {
                      [_delegate performSelector:_callback withObject:status];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              id json;
              NSData *data;
              if (operation.responseString)
                  data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              if (data)
                  json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:json?json:nil];
              }
          }];
}
- (void)getServerDisLikeOffer:(NSString*)offerID  WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
    _delegate = Delegate;
    _callback = CallBack ;
    _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kDISLIKE_OFFER,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *userID = [NSString stringWithFormat:@"%@",[DeviceDTO shareManager].userId];
    NSDictionary *params = @ {kOFFER_ID : offerID, kUSER_ID : userID};
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSString *status = [responseObject objectForKey:@"status"];
              NSDictionary *dictOffer = [responseObject objectForKey:@"data"];
              [[OfferDTO shareManager] saveLikeOffer:dictOffer];
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback]) {
                      [_delegate performSelector:_callback withObject:status];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              id json;
              NSData *data;
              if (operation.responseString)
                  data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              if (data)
                  json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:json?json:nil];
              }
          }];
}
- (void)getServerMyOfferWithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
    _delegate = Delegate;
    _callback = CallBack ;
    _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kMY_OFFER,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *userID = [NSString stringWithFormat:@"%@",[DeviceDTO shareManager].userId];
    NSDictionary *params = @ {kUSER_ID : userID};
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSArray *arrayOffers = [responseObject objectForKey:@"data"];
              [[OfferDTO shareManager] saveOffersList:arrayOffers];
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback]) {
                      [_delegate performSelector:_callback withObject:nil];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              id json;
              NSData *data;
              if (operation.responseString)
                  data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              if (data)
                  json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:json?json:nil];
              }
          }];
}
- (void)getServerDeleteOffer:(NSString*)offerID WithDelegate:(id)Delegate WithSelector:(SEL)CallBack  WithErrorSelector:(SEL)requestErrorSelector {
    _delegate = Delegate;
    _callback = CallBack ;
    _errorCallback = requestErrorSelector;
    NSString *URL_REGISTER = [NSString stringWithFormat:@"%@%@%@&lang=en&version=1.0", SERVER_API,kDELETE_OFFER,[DeviceDTO shareManager].deviceId];
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:30];
    NSString *userID = [NSString stringWithFormat:@"%@",[DeviceDTO shareManager].userId];
    NSDictionary *params = @ {kOFFER_ID : offerID, kUSER_ID : userID};
    [manager POST:URL_REGISTER parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSString *status = [responseObject objectForKey:@"status"];
              if(_delegate && _callback) {
                  if([_delegate respondsToSelector:_callback] && [status isEqualToString:@"ok"]) {
                      [_delegate performSelector:_callback withObject:nil];
                  } else {
                      if(_errorCallback) {
                          [_delegate performSelector:_errorCallback withObject:nil];
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              id json;
              NSData *data;
              if (operation.responseString)
                  data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              if (data)
                  json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
              if(_errorCallback) {
                  [_delegate performSelector:_errorCallback withObject:json?json:nil];
              }
          }];
}
*/
@end
