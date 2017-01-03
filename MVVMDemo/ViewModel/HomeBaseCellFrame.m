//
//  HomeBaseCellFrame.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "HomeBaseCellFrame.h"

@implementation HomeBaseCellFrame


- (void)setListContentDelegate:(id<ELYHomeListContentProtocol>)listContentDelegate
{
    _listContentDelegate = listContentDelegate;
    
    // 店头像
    CGFloat headX = kBaseGapToSuperView;
    CGFloat headY = kBaseGapToSuperView;
    _headImageViewRect = (CGRect){{headX, headY}, {kBaseHeadImageViewW,kBaseHeadImageViewW}};
    
    // 店名
    CGFloat nameLabelX = CGRectGetMaxX(_headImageViewRect) + kBaseGapBetweenSubViews;
    CGFloat nameLabelY = headY;
    NSString *userName = listContentDelegate.store_name;
    if (userName == nil || userName.length == 0) {
        userName = @"null";
    }
    CGFloat nameLabelWidth = [userName widthWithFont:kBase16Font maxWidth:185];
    _nameLabelRect = (CGRect){{nameLabelX, nameLabelY}, {nameLabelWidth, 19.f}};
    
    // 店经营时间
    CGFloat timeLabelY = CGRectGetMaxY(_headImageViewRect) + kBaseGapBetweenSubViews;
    _timeLabelRect = (CGRect){{headX,timeLabelY}, {nameLabelWidth, 19.f}};
    
    // 地点
    CGFloat addressLabelWidth = [listContentDelegate.region_name widthWithFont:kBase12Font maxWidth:kBaseCellWith-headX];
    CGFloat addressLabelRect = CGRectGetMaxY(_timeLabelRect) + kBaseGapBetweenSubViews;
    _addressLabelRect = (CGRect){{headX,addressLabelRect}, {addressLabelWidth,kBaseAddressLabelH}};
    
    // 关注
    CGFloat attentionBtnX = kBaseCellWith - kBaseBtnW - kBaseGapToSuperView;
    _attentionBtnRect = (CGRect){{attentionBtnX, nameLabelY}, {kBaseBtnW,kBaseBtnH}};
    
    // 关注人数
    CGFloat attentionNumLabelWidth = [listContentDelegate.follow_num widthWithFont:kBase12Font maxWidth:120];
    CGFloat attentionNumLabelX = attentionBtnX + kBaseBtnW/2.0 - attentionNumLabelWidth/2.0;
    CGFloat attentionNumLabelY = CGRectGetMaxY(_attentionBtnRect) + kBaseGapBetweenSubViews;
    _attentionNumLabelRect = (CGRect){ {attentionNumLabelX, attentionNumLabelY}, attentionNumLabelWidth, 13};
    
    // 高度
    _cellHeight += CGRectGetMaxY(_addressLabelRect);
}


@end
