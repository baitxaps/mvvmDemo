//
//  CommonImageListView.m
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import "CommonImageListView.h"
#import "CommonImageView.h"
#import "ELYHomeListContentProtocol.h"

#define kTripOneImageWidth  120
#define kTripOneImageHeight kTripOneImageWidth

#define kTripImageWidth     60
#define kTripImageHeight    60

#define kTripImageMargin    5
#define kTripImageTag       77

@interface CommonImageListView () <CommonImageViewDelegate>

@end

@implementation CommonImageListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i < 9; i++) {
            CommonImageView *imageView = [[CommonImageView alloc] init];
            [imageView setImageTag:kTripImageTag + i];
            imageView.delegate = self;
            [self addSubview:imageView];
        }
    }
    return self;
}

#pragma mark - 布局子视图

- (void)setImage:(NSArray *)images
{
    NSInteger imageCount = images.count;
    NSInteger count = self.subviews.count;
    
    for (int i = 0; i< count;  i++) {
        CommonImageView *child = self.subviews[i];
        
        if (i >= imageCount) {
            child.hidden = YES;
        } else {
            child.hidden = NO;
            
            if (imageCount == 1) {
                child.frame = CGRectMake(0, 0, kTripOneImageWidth, kTripOneImageHeight);
                child.contentMode = UIViewContentModeScaleAspectFit;
                
            } else {
                int divide = (imageCount == 4) ? 2 : 3;
                int column = i % divide;
                int row = i / divide;
                
                int childX = column * (kTripImageWidth + kTripImageMargin);
                int childY = row * (kTripImageHeight + kTripImageMargin);
                child.frame = CGRectMake(childX, childY, kTripImageWidth, kTripImageHeight);
                child.contentMode = UIViewContentModeScaleToFill;
            }
            
            child.image = images[i];
        }
    }
}

- (NSArray *)getImages:(NSArray *)images{
    
    NSMutableArray *tmp = [[NSMutableArray alloc]initWithCapacity:images.count];
    for (id <ELYHomeListContentProtocol> m in images) {
        [tmp addObject:m.default_image];
    }
    return tmp;
}

- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = [self getImages:imageUrls];
    
    NSInteger imageCount = imageUrls.count;
    NSInteger count = self.subviews.count;
    
    for (int i = 0; i< count;  i++) {
        CommonImageView *child = self.subviews[i];
        
        if (i >= imageCount) {
            child.hidden = YES;
        } else {
            child.hidden = NO;
            
            if (imageCount == 1) {
                child.frame = CGRectMake(0, 0, kTripOneImageWidth, kTripOneImageHeight);
                child.contentMode = UIViewContentModeScaleAspectFit;
                
            } else {
                
                int divide = (imageCount == 4) ? 2 : 3;
                
                int column = i % divide;
                int row = i / divide;
                
                int childX = column * (kTripImageWidth + kTripImageMargin);
                int childY = row * (kTripImageHeight + kTripImageMargin);
                child.frame = CGRectMake(childX, childY, kTripImageWidth, kTripImageHeight);
                child.contentMode = UIViewContentModeScaleToFill;
            }
            
            child.urlString = _imageUrls[i];
        }
    }
}

+ (CGSize)imageSizeWithCount:(NSInteger)count
{
    if (count == 1) return CGSizeMake(kTripOneImageWidth, kTripOneImageHeight);
    
    NSInteger rows = (count + 2)/3;
    
    CGFloat height = rows * kTripImageHeight + (rows - 1) * kTripImageMargin;
    
    NSInteger columns = (count >= 3) ? 3 : count;
    
    CGFloat width = columns * kTripImageWidth + (columns - 1) * kTripImageMargin;
    
    return CGSizeMake(width, height);
}


#pragma mark - Delegate Method

#pragma mark - GOTripImageView Method

- (void)commonImageViewClick:(int)imageTag
{
    if ([_delegate respondsToSelector:@selector(commonImageListViewClick:)]) {
        [_delegate commonImageListViewClick:imageTag - kTripImageTag];
    }
}

- (void)dealloc
{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}
@end
