//
//  NSString+Size.h
//  MVVMDemo
//
//  Created by rhc on 11/05/16.
//  Copyright © 2016年 rhc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Size)

+(CGSize)getWidthWithText:(NSString*)text andFont:(UIFont*)font;

- (CGFloat)widthWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;
@end
