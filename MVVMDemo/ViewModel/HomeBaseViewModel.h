//
//  HomeBaseViewModel.h
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//
#import "Config.h"
#import "JSONModel.h"


#define STATUS_CODE @"statusCode"
#define RELOGIN     @"reLogin"

typedef void(^success)(NSURLSessionDataTask *task, id responseObject);
typedef void(^failureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void(^failure)(NSError *error, NSURLSessionDataTask *task);

@interface HomeBaseViewModel : NSObject

+ (NSURLSessionDataTask *)postWithUrlString:(NSString *)urlStr
                                parameters:(NSDictionary *)parameters
                                   success:(success)successBlock
                                   failure:(failureBlock)failureBlock;

+(void)arrayFromDataArray:(Class)modelClass
                      task:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(void (^) (NSMutableArray *mutableArray,NSURLSessionDataTask *task))successBlock
                   failure:(void (^) (NSError *error,NSURLSessionDataTask *task))failureBlock;
@end
