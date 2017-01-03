//
//  HomeViewModel.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeListCellFrame.h"
#import "MJHomeModel.h"
#import "CreateModel.h"
#import "FilesOp.h"

@implementation HomeViewModel


+ (NSURLSessionDataTask *)fetchHomeDataWithParameters:(NSDictionary *)parameters
                                              Success:(void (^)(NSMutableArray *, NSURLSessionDataTask *))successBlock
                                              failure:(failure)failureBlock {
    
    NSDictionary *localDatas = [FilesOp loadResp:@"list.json"];;
    if (localDatas.count) {
        NSMutableArray *m = [NSMutableArray new];
        NSArray *s = localDatas[@"data"];
        for (int i=0; i<[s count]; i ++) {
            MJHomeModel *tmp = [MJHomeModel mj_objectWithKeyValues:s[i]];
            [m addObject:tmp];
        }
        
        NSMutableArray *cellFrames  = [HomeViewModel cellViewFrame:m];
        successBlock(cellFrames, nil);
        
        return nil;
    }
    
    return [self postWithUrlString:HOME_HOMEURL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [FilesOp  saveResp:responseObject type:2];
        
        NSDictionary *tmp = responseObject[@"data"][0];
        if (tmp.count) {
            tmp = tmp[@"consult_list"][0];
            if (tmp.count) {
                 [CreateModel createFileWithModelName:@"HomeViewModel" dictionary:tmp]; 
            }
        }
       
        NSMutableArray *m = [NSMutableArray new];
        NSArray *data = responseObject[@"data"];
        for (int i=0; i<[data count]; i ++) {
            MJHomeModel *tmp = [MJHomeModel mj_objectWithKeyValues:data[i]];
            [m addObject:tmp];
        }
        
        NSMutableArray *cellFrames  = [HomeViewModel cellViewFrame:m];
        successBlock(cellFrames, task);

        /*
        [self arrayFromDataArray:[HomeListModel class] task:task responseObject:responseObject success:^(NSMutableArray *mutableArray, NSURLSessionDataTask *task) {
            if (successBlock) {
                
                NSMutableArray *cellFrames  = [HomeViewModel cellViewFrame:mutableArray];
                successBlock(cellFrames, task);
            }
        } failure:^(NSError *error, NSURLSessionDataTask *task) {
            if (failureBlock) {
                failureBlock(error, task);
            }
        }];
         */

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failureBlock) {
            failureBlock (error, task);
        }
    }];
}


+ (NSMutableArray *)cellViewFrame:(NSArray *)data {
    
    NSMutableArray *cellFrames = [[NSMutableArray alloc]initWithCapacity:data.count];
    if ([data count] > 0) {
        for (MJHomeModel *listEntity in data) {
            @autoreleasepool {
                HomeListCellFrame *cellFrame = [[HomeListCellFrame alloc] init];
                cellFrame.listContentDelegate = listEntity;
                [cellFrames addObject:cellFrame];
            }
        }
    }
    return cellFrames;
}

@end
