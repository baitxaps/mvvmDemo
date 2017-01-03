//
//  HomeListCellFrame.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "HomeListCellFrame.h"
#import "CommonImageListView.h"

@implementation HomeListCellFrame


- (void)setListContentDelegate:(id<ELYHomeListContentProtocol>)contentDelegate{
    [super setListContentDelegate:contentDelegate];
    
    [self delegeHandleListLayout];
    
}

- (void)delegeHandleListLayout{
    // 部分子视图y坐标起始位置
    CGFloat addressLabelX  = CGRectGetMinX(self.addressLabelRect);
    CGFloat addressLabelMaxY = CGRectGetMaxY(self.addressLabelRect);
    CGFloat startY = addressLabelMaxY;
    
    // 计算图片
    CGFloat imageListViewX = addressLabelX;
    CGFloat imageListViewY = startY + kBaseGapBetweenSubViews;
    CGSize imageListViewSize = [CommonImageListView imageSizeWithCount:self.listContentDelegate.goods_list.count];
    _imageListViewRect = (CGRect){{imageListViewX, imageListViewY}, imageListViewSize};
    startY = imageListViewY + imageListViewSize.height;
    
    
    // 上传时间
    CGFloat goodsUploadTimeLabelX = addressLabelX;
    CGFloat goodsUploadTimeLabelY =  CGRectGetMaxY(_imageListViewRect) + kBaseGapBetweenSubViews;
    NSString *uploadText = [NSString stringWithFormat:@"上市时间:%@,本月上新%@款",self.listContentDelegate.last_show_time,self.listContentDelegate.goods_count];
    CGFloat attentionNumLabelWidth = [uploadText widthWithFont:kBase10Font maxWidth:220];
    _goodsUploadTimeRect = (CGRect){{goodsUploadTimeLabelX, goodsUploadTimeLabelY}, {attentionNumLabelWidth, 21}};
    
    // 分享
    CGFloat shareBtnBtnY = goodsUploadTimeLabelY;
    CGFloat shareBtnX = kBaseCellWith - kBaseBtnH - kBaseGapToSuperView;
    _shareBtnRect = (CGRect){{shareBtnX, shareBtnBtnY}, {kBaseBtnH, kBaseBtnH}};
    
    // 打电话
    CGFloat dailPoneBtnX = shareBtnX - kBaseBtnH -kBaseGapBetweenSubViews;
    _dailPoneRect = (CGRect){{dailPoneBtnX, shareBtnBtnY}, {kBaseBtnH, kBaseBtnH}};
    
    // 聊天
    CGFloat sendContentBtnX = dailPoneBtnX - kBaseBtnH- kBaseGapBetweenSubViews;
    _sendContentRect = (CGRect){{sendContentBtnX, shareBtnBtnY}, {kBaseBtnH, kBaseBtnH}};
    
    // 评论
    CGFloat commentViewY = CGRectGetMaxY(_goodsUploadTimeRect) + kBaseGapBetweenSubViews;
    CGFloat conmmentViewW = SCREEN_WIDTH -goodsUploadTimeLabelX - kBaseGapBetweenSubViews;
    _commentViewRect = (CGRect){{goodsUploadTimeLabelX, commentViewY}, {conmmentViewW, 40}};
    _cellHeight = CGRectGetMaxY(_commentViewRect);
    
    _cellHeight += kBaseGapBetweenSubViews;
}


@end
