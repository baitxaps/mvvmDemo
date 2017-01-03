//
//  UIView+Draw.h
//  Seller
//
//  Created by rhc on 15/03/16.
//  Copyright © 2016年 Eelly.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Draw)
- (UIView *)drawBounderWidth:(CGFloat)width Color:(UIColor *)color;
- (UIView *)drawBounderWidth:(CGFloat)width radius:(CGFloat)radius Color:(CGColorRef )color;
@end

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

@interface UIButton (EdgeInset)

- (void)adaptEdgeInsetWithTitle:(NSString *)title image:(UIImage *)image;

@end