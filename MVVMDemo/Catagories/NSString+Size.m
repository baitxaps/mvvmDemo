//
//  NSString+Size.m
//  MVVMDemo
//
//  Created by rhc on 11/05/16.
//  Copyright © 2016年 rhc. All rights reserved.
//

#import "NSString+Size.h"
#import "UILayoutConst.h"

@implementation NSString (Size)

+(CGSize)getWidthWithText:(NSString*)text andFont:(UIFont*)font
{
    CGSize size;
    if (IS_IOS7){
        CGRect rect = [text boundingRectWithSize:CGSizeMake(HUGE_VAL, HUGE_VAL) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil];
        size = rect.size;
    }
    else{
        size = [text sizeWithFont:font constrainedToSize:CGSizeMake(HUGE_VAL, HUGE_VAL) lineBreakMode:NSLineBreakByCharWrapping];
    }
    return size;
}

- (CGFloat)widthWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    if (self.length == 0) {
        return 0.0;
    }
    CGSize textSize;
    if (!IS_IOS7) {
        if (maxWidth == 0) {
            textSize = [self textSizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, 21)];
        } else {
            textSize = [self textSizeWithFont:font constrainedToSize:CGSizeMake(maxWidth, 21)];
        }
    } else {
        if (maxWidth == 0) {
            textSize = [self textSizeWithFont:font constrainedToSize:CGSizeMake(0, 21)];
        } else {
            textSize = [self textSizeWithFont:font constrainedToSize:CGSizeMake(maxWidth, 21)];
        }
    }
    return textSize.width;
}

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize textSize;
    if (!IS_IOS7) {
        if (CGSizeEqualToSize(size, CGSizeZero)) {
            textSize = [self sizeWithFont:font];
        } else {
            textSize = [self sizeWithFont:font
                        constrainedToSize:size
                            lineBreakMode:NSLineBreakByCharWrapping];
        }
    } else {
        if (CGSizeEqualToSize(size, CGSizeZero)) {
            //  NSDictionary *attributes = @{NSFontAttributeName:font}
            NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
            textSize = [self sizeWithAttributes:attributes];
        } else {
            
            NSDictionary *attribute = @{NSFontAttributeName: font};
            textSize = [self boundingRectWithSize:CGSizeMake(size.width, 0)
                                          options:\
                        NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil].size;
            textSize.height = ceil(textSize.height);
            textSize.width = ceil(textSize.width);
        }
    }
    return textSize;
}



@end
