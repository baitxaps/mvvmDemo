//
//  ELYHomeConsultProtocol.h
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ELYHomeConsultProtocol <NSObject>
/**
 *  ip
 */
@property(copy, nonatomic) NSString *ip;
/**
 *  留言姓名
 */
@property(copy, nonatomic) NSString *consultor_name;
/**
 *  留言
 */
@property(copy, nonatomic) NSString *content;
/**
 *  user_id
 */
@property(copy, nonatomic) NSString *user_id;
@end
