//
//  CommonImageView.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "CommonImageView.h"
#import "UIImageView+WebCache.h"

@implementation CommonImageView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
        [self addGestureRecognizer:tap];
        tap.view.exclusiveTouch = YES;
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    
    // 1.加入 WebImage library
    [self sd_setImageWithURL:[NSURL URLWithString:urlString]
            placeholderImage:[UIImage imageNamed:@"DownloadFail.png"]
                     options:SDWebImageLowPriority | SDWebImageRetryFailed];
}

#pragma mark - 点击手势

- (void)tapGestureAction:(UITapGestureRecognizer *)guest
{
    if ([_delegate respondsToSelector:@selector(commonImageViewClick:)]) {
        [_delegate commonImageViewClick:_imageTag];
    }
}

@end
