//
//  CommonImageListView.h
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CommonImageListViewDelegate <NSObject>

@optional

- (void)commonImageListViewClick:(NSInteger)imageIndex;

@end

@interface CommonImageListView : UIView

@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, weak) id <CommonImageListViewDelegate> delegate;

+ (CGSize)imageSizeWithCount:(NSInteger)count;
- (void)setImageUrls:(NSArray *)imageUrls;
- (void)setImage:(NSArray *)image;

@end


