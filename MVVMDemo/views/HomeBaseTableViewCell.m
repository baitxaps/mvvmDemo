//
//  HomeBaseTableViewCell.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "HomeBaseTableViewCell.h"
#import "UIImageView+WebCache.h"


@implementation HomeBaseTableViewCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addBaseSubviews];
    }
    return self;
}

- (void)addBaseSubviews
{
    // 1.店头像
    _headImageView = [[UIImageView alloc] init];
    _headImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headGestureAction:)];
    [_headImageView addGestureRecognizer:headTap];
    [self.contentView addSubview:_headImageView];
    headTap.view.exclusiveTouch = YES;
    
    // 2.店名
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = kBase13Font;
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_nameLabel];

    
    // 3.时间
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = kBase13Font;
    _timeLabel.backgroundColor = [UIColor clearColor];
    _timeLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_timeLabel];
    
    // 4.地点
    _addressLabel = [[UILabel alloc] init];
    _addressLabel.font = kBase12Font;
    _addressLabel.backgroundColor = [UIColor clearColor];
    _addressLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_addressLabel];
    
    // 5.关注
    _attentionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.contentView addSubview:_attentionBtn];
    
    // 5.关注人数
    _addtntionNumLabel = [[UILabel alloc] init];
    _addtntionNumLabel.font = kBase12Font;
    _addtntionNumLabel.backgroundColor = [UIColor clearColor];
    _addtntionNumLabel.textColor = kBaseRGBColor(149, 149, 149);
    _addtntionNumLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_addtntionNumLabel];
}

- (void)headGestureAction:(UITapGestureRecognizer *)tap
{
 // to do ...
}


- (void)setBaseCellFrame:(HomeBaseCellFrame *)cellFrame
{
    _baseCellFrame = cellFrame;
    id <ELYHomeListContentProtocol> listModel = cellFrame.listContentDelegate;
    
    
    _headImageView.frame = _baseCellFrame.headImageViewRect;
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:listModel.store_logo]
            placeholderImage:[UIImage imageNamed:@"DownloadFail.png"]
                               options:SDWebImageLowPriority | SDWebImageRetryFailed];
    
    
    _nameLabel.text = listModel.store_name;
    _nameLabel.frame = _baseCellFrame.nameLabelRect;
    
    _timeLabel.text = listModel.open_year_new;
    _timeLabel.frame = _baseCellFrame.timeLabelRect;
    
    
    _addressLabel.frame = _baseCellFrame.addressLabelRect;
    _addressLabel.text = listModel.region_name;
  
    
    _attentionBtn.frame = _baseCellFrame.attentionBtnRect;
    [_attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [_attentionBtn drawBounderWidth:1 Color:[UIColor grayColor]];
    
    _addtntionNumLabel.text = listModel.follow_num;
    _addtntionNumLabel.frame = _baseCellFrame.attentionNumLabelRect;
}


@end
