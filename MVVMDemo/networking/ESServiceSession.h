//
//  ESServiceSession.h
//  Seller
//
//  Created by rhc on 2017/01/04.
//  Copyright (c) 2017 Eelly.com. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface ESServiceSession : AFHTTPSessionManager

@property (assign, nonatomic) id cacheData;

+ (instancetype)sessionManager;

/**
 *  清空authToken
 */
- (void)clearSessionHeader;

@end
