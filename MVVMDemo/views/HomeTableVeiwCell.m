//
//  HomeTableVeiwCell.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "HomeTableVeiwCell.h"
#import "Config.h"

@interface HomeTableVeiwCell()<CommonImageListViewDelegate>
{
    //1.图片组
    CommonImageListView *_imageListView;;
    
    //2.上传时间
    UILabel *_goodsUploadTimeLabel;
    
    // 3.聊天
    UIButton *_sendContentBtn;
    
    // 打电话
    UIButton *_dailPoneBtn;
    
    // 分享
    UIButton *_shareBtn;
    
    // 6.评论view
    UIView *_commentView;
}

@end

@implementation HomeTableVeiwCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}


#pragma mark - 添加子控件

- (void)setupSubviews
{
    //1.图片组
    _imageListView = [[CommonImageListView alloc] init];
    _imageListView.contentMode = UIViewContentModeScaleAspectFit;
    _imageListView.delegate = self;
    [self.contentView addSubview:_imageListView];
    
    // 2.上传时间
    _goodsUploadTimeLabel = [[UILabel alloc] init];
    _goodsUploadTimeLabel.font = kBase10Font;
    _goodsUploadTimeLabel.backgroundColor = [UIColor clearColor];
     _goodsUploadTimeLabel.textColor = [UIColor lightGrayColor];
    _goodsUploadTimeLabel.numberOfLines = 0;
    [self.contentView addSubview:_goodsUploadTimeLabel];
  
    // 3.聊天
    _sendContentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_sendContentBtn];
    
    // 4.分享
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_shareBtn];
    
    // 5.打电话
    _dailPoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_dailPoneBtn];
 
    // 6.评论
    _commentView = [[UIView alloc] init];
    [self.contentView addSubview:_commentView];
}

- (void)setCellFrame:(HomeListCellFrame *)cellFrame
{
    [super setBaseCellFrame:cellFrame];

    _cellFrame = cellFrame;
    
     id <ELYHomeListContentProtocol> listModel = cellFrame.listContentDelegate;
    // 上传时间
    NSString *uploadText = [NSString stringWithFormat:@"上市时间:%@,本月上新%@款",listModel.last_show_time,listModel.goods_count];
    _goodsUploadTimeLabel.text = uploadText;
    _goodsUploadTimeLabel.frame = cellFrame.goodsUploadTimeRect;
    
    // 打电话
    _dailPoneBtn.frame = cellFrame.dailPoneRect;
    [_dailPoneBtn setImage:[UIImage imageNamed:@"icon_phone"] forState:UIControlStateNormal];
    
    // 分享
    _shareBtn.frame = cellFrame.shareBtnRect;
    [_shareBtn setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
   
    //聊天
    _sendContentBtn.frame = cellFrame.sendContentRect;
     [_sendContentBtn setImage:[UIImage imageNamed:@"icon_chat"] forState:UIControlStateNormal];
    
    // 图片
    [_imageListView setImageUrls:listModel.goods_list];
    _imageListView.frame = cellFrame.imageListViewRect;

    // 评论
    [_commentView setFrame:cellFrame.commentViewRect];
    [_commentView drawBounderWidth:1 Color:[UIColor grayColor]];
    
    
    // ....

}


#pragma mark - CommonImageListViewDelegate
- (void)commonImageListViewClick:(NSInteger)imageIndex
{
    
    debugLog(@"%s 点击了第%ld张图片",__func__ ,(long)imageIndex );
    
    
}

@end
