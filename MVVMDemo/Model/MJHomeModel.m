//
//  MJHomeModel.m
//  MVVMDemo
//
//  Created by hairong chen on 16/5/11.
//  Copyright © 2016年 rhc. All rights reserved.
//

#import "MJHomeModel.h"

@implementation  MJConsultModel
@end


@implementation MJGoodsModel
@end

@implementation MJHomeModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods_list"  : @"MJGoodsModel",
             @"consult_list" : @"MJConsultModel"
             };
}

/**
 *  替换属性名
 */
//+ (NSDictionary *)mj_replacedKeyFromPropertyName
//{
//    
//    return @{@"goodsLink" : @"copyGoodsLink"};
//}

MJExtensionCodingImplementation

@end

