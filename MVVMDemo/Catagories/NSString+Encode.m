//
//  NSString+Encode.m
//  Seller
//
//  Created by rhc on 2017/01/04.
//  Copyright (c) 2014年 Eelly.com. All rights reserved.
//

#import "NSString+Encode.h"
#import <CommonCrypto/CommonDigest.h>



@implementation NSString (Encode)

+ (NSString *)base64Decode:(NSString *)string
{
    if (string == nil) {
        return nil;
    }
    
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}

+ (NSData *)base64DecodeReturnData:(NSString *)string
{
    if (string == nil) {
        return nil;
    }
    
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    return decodedData;
}

+ (NSString *)base64Encode:(NSString *)string
{
    if (string == nil ) {
        return nil;
    }
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedString = [data base64EncodedStringWithOptions:0];
    return encodedString;
}

+ (NSString *)base64EncodeWithASCII:(NSString *)string
{
    if (string == nil ) {
        return nil;
    }
    
    NSData *data = [string dataUsingEncoding:NSASCIIStringEncoding];
    NSString *encodedString = [data base64EncodedStringWithOptions:0];
    return encodedString;
}

+ (NSString *)translateToMD5:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}




@end
