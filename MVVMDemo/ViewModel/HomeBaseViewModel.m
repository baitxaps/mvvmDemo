//
//  HomeBaseViewModel.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "HomeBaseViewModel.h"

#import "Config.h"
#import "ESServiceSession.h"


static  inline  NSString*   domainFromResponseObject(NSDictionary* responseObject){
    id  msg = responseObject[@"message"];
    if ([msg isKindOfClass:[NSString class]]){
        return (NSString*)msg;
    }
    else{
        debugLog(@"unexpected message value %@", msg);
        return @"服务器后台错误";
    }
};

@implementation HomeBaseViewModel

+(NSURLSessionDataTask *)postWithUrlString:(NSString *)urlStr
                                parameters:(NSDictionary *)parameters
                                   success:(success)successBlock
                                   failure:(failureBlock)failureBlock
{
    debugLog(@"---------------------------- 请求的API ---------------------\n%@%@", BASEURL, urlStr);
    debugLog(@"---------------------------- 请求的API参数 ---------------------\n%@",parameters);
    return [[ESServiceSession sessionManager] POST:urlStr parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[STATUS_CODE] integerValue] == STATUS_CODE_SUCCESS) {
            if (successBlock) {
                successBlock(task,responseObject);
            }
        } else if ([responseObject[STATUS_CODE] integerValue] == STATUS_CODE_TOKEN_EXPIRED) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:RELOGIN object:self];
            return ;
        } else {//参数错误
            if (failureBlock) {
                NSError *error = [NSError errorWithDomain:domainFromResponseObject(responseObject) code:0 userInfo:nil];
                failureBlock(task,error);
            }
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failureBlock) {// 连接服务器错误
            failureBlock(task,[self errorWithError:error]);
        }
    }];
}


+(void) arrayFromDataArray:(Class)modelClass
                      task:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(void (^) (NSMutableArray *mutableArray,NSURLSessionDataTask *task))successBlock
                   failure:(void (^) (NSError *error,NSURLSessionDataTask *task))failureBlock
{
    if ([responseObject[@"statusCode"] integerValue] == 0) {//如果请求成功的话
        NSArray *data;
        
        if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
            data = responseObject[@"data"];
        }else{
            data = responseObject[@"data"][@"list"];
        }
        
        if (data.count >0) {
            NSMutableArray *resultArray = [[NSMutableArray alloc] init];
            //  NSLog(@"%@",data);
            // 把data里面的字典全转换为模型后赋给新的数组
            for (int i=0; i<[data count]; i ++) {
                NSError *error;
                id dataModel = (JSONModel *)[[modelClass alloc] initWithDictionary:data[i] error:&error];
                if (dataModel) {
                    [resultArray addObject:dataModel];
                }
            }
            if (successBlock) {
                successBlock(resultArray,task);
            }
        }
        else{
            if (successBlock) {
                successBlock(nil,task);
            }
        }
    }else{// 如果请求出错返回message或网络出错{
        NSError *error = [NSError errorWithDomain:domainFromResponseObject(responseObject) code:0 userInfo:nil];
        if (failureBlock) {
            failureBlock(error,task);
        }
    }
}


+ (NSError *)errorWithError:(NSError *)error
{
    if (error) {
        if (error.code == -1004 || error.code == -1009 || error.code == -1003) {//没有网络
            NSError *err = [NSError errorWithDomain:@"没有检测到网络" code:error.code userInfo:nil];
            return err;
        }
        if (error.code == -999) {//没有网络
            NSError *err = [NSError errorWithDomain:@"请求已取消" code:error.code userInfo:nil];
            return err;
        }
        if (error.code == -1011 || error.code == -1002 || error.code == 3840) {//Error Domain=com.alamofire.error.serialization.response
            NSError *err = [NSError errorWithDomain:@"服务器返回数据格式出错" code:error.code userInfo:nil];
            return err;
        }
        if (error.code == -1001) {//NSURLErrorDomain Code=-1001
            NSError *err = [NSError errorWithDomain:@"未能完成操作" code:error.code userInfo:nil];
            return err;
        }
        if ([error.domain isEqualToString:@"NSCocoaErrorDomain"]) {
            NSError *err = [NSError errorWithDomain:@"请求服务器出错" code:error.code userInfo:nil];
            return err;
        }
    }
    
    return error;
}

@end
