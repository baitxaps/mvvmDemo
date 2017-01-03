//
//  UIView+Draw.m
//  Seller
//
//  Created by rhc on 15/03/16.
//  Copyright © 2016年 Eelly.com. All rights reserved.
//

#import "UIView+Draw.h"
#import "UILayoutConst.h"
@implementation UIView (Draw)

- (UIView *)drawBounderWidth:(CGFloat)width  Color:(UIColor *)color
{
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color.CGColor];
    return self;
}

- (UIView *)drawBounderWidth:(CGFloat)width radius:(CGFloat)radius Color:(CGColorRef)color
{
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color];
    [self.layer setCornerRadius:radius];
    return self;
}

@end

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

@implementation UIButton (EdgeInset)

- (void)adaptEdgeInsetWithTitle:(NSString *)title image:(UIImage *)image{
   
    CGSize strSize = [title sizeWithAttributes:@{NSFontAttributeName: kBase12Font}];
    CGSize btnSize = self.frame.size;
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, btnSize.width - 10 - image.size.width, 0, (10 - strSize.width))];
    
   
    CGFloat titleRightInset =  - 10 - strSize.width;
    if (titleRightInset < 10 + image.size.width) {
        titleRightInset = 10 + image.size.width;
    }
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (10 - image.size.width), 0, titleRightInset)];
}

@end