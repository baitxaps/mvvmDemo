//
//  NSString+Encode.h
//  Seller
//
//  Created by rhc on 2017/01/04.
//  Copyright (c) 2014年 Eelly.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encode)

/*!
 *  解析base64的字符串
 *
 *  @param base64格式的string
 *
 *  @return NSString的字符串
 */
+ (NSString *)base64Decode:(NSString *)string;

+ (NSData *)base64DecodeReturnData:(NSString *)string;

/*!
 *  编译成base64的字符串
 *
 *  @param NSString
 *
 *  @return base64格式的string
 */
+ (NSString *)base64Encode:(NSString *)string;

+ (NSString *)base64EncodeWithASCII:(NSString *)string;

/*!
 *  编译成MD5格式的字符串
 *
 *  @param input NSString
 *
 *  @return MD5 string 
 */
+ (NSString *)translateToMD5:(NSString *)input;


@end
