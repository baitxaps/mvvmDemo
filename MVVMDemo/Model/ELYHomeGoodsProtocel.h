//
//  ELYHomeGoodsProtocel.h
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ELYHomeGoodsProtocel <NSObject>

/**
 *  商品ID
 */
@property(copy, nonatomic) NSString *goods_id;

/**
 *  商品名称
 */
@property(copy, nonatomic) NSString *goods_name;

/**
 *  图片
 */
@property(copy, nonatomic) NSString *default_image;

@property(copy, nonatomic) NSString *last_show_time;

@property(copy, nonatomic) NSString *orderGoodsCount;
/**
 *  价格
 */
@property(copy, nonatomic) NSString *lowPrice;
@property(copy, nonatomic) NSString *upperPrice;
@property(copy, nonatomic) NSString *price;

@end
