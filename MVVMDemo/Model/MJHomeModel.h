//
//  MJHomeModel.h
//  MVVMDemo
//
//  Created by hairong chen on 16/5/11.
//  Copyright © 2016年 rhc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "ELYHomeListContentProtocol.h"

@interface MJConsultModel : NSObject
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

@interface MJGoodsModel : NSObject

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

@interface MJHomeModel : NSObject<ELYHomeListContentProtocol>
/**
 *  我的关注-新商品数
 */
@property(copy, nonatomic) NSString *goods_new_count;
/**
 *  我的关注-是否开店
 */
@property(copy, nonatomic) NSString *is_open;
/**
 *  超好卖-数量
 */
@property(copy, nonatomic) NSString *count;
/**
 *  超好卖-浏览量
 */
@property(copy, nonatomic) NSString *pv;
/**
 *  超好卖-销售量
 */
@property(copy, nonatomic) NSString *sold_count;
/**
 *  超好卖-商品ID
 */
@property(copy, nonatomic) NSString *goods_id;
/**
 *  超好卖-商品名称
 */
@property(copy, nonatomic) NSString *goods_name;
/**
 *  超好卖-商品图片
 */
@property(copy, nonatomic) NSArray *image_urls;
/**
 *  超好卖-最低价格
 */
@property(copy, nonatomic) NSString *min_price;
/**
 *  超好卖-最高价格
 */
@property(copy, nonatomic) NSString *max_price;
/**
 *  商铺ID
 */
@property(copy, nonatomic) NSString *store_id;
/**
 *  商铺名称
 */
@property(copy, nonatomic) NSString *store_name;
/**
 *  商铺LOGO
 */
@property(copy, nonatomic) NSString *store_logo;
/**
 *  商铺LOGO
 */
@property(copy, nonatomic) NSString *store_url;
/**
 *  商铺地址
 */
@property(copy, nonatomic) NSString *region_name;
/**
 *  电话号码
 */
@property(copy, nonatomic) NSString *mobile;
/**
 *  是否关注
 */
@property(copy, nonatomic) NSString *has_follow;
/**
 *  关注人数
 */
@property(copy, nonatomic) NSString *follow_num;
/**
 *  开店年限
 */
@property(copy, nonatomic) NSString *open_year;

@property(copy, nonatomic) NSString *open_year_new;

/**
 *  是否48小时无理由退款
 */
@property(copy, nonatomic) NSString *no_reason_return;
/**
 *  本月上新款数
 */
@property(copy, nonatomic) NSString *goods_count;
/**
 *  平均价格
 */
@property(copy, nonatomic) NSString *avg_price;
/**
 *  咨询数量
 */
@property(copy, nonatomic) NSString *consult_count;

/**
 *  上市时间
 */
@property(copy, nonatomic) NSString *last_show_time;

/**
 *  商品列表
 */
@property(copy, nonatomic) NSArray *goods_list;

/**
 *  咨询列表
 */
@property(copy, nonatomic) NSArray *consult_list;

/**
 *  goods protocol
 */
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


/**
 *  咨询 protocol
 */

/**
 *  图片
 */
@property(copy, nonatomic) NSString *default_image;

@property(copy, nonatomic) NSString *orderGoodsCount;
/**
 *  价格
 */
@property(copy, nonatomic) NSString *lowPrice;
@property(copy, nonatomic) NSString *upperPrice;
@property(copy, nonatomic) NSString *price;

@end


