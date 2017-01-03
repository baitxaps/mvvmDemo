//
//  UILayoutConst.h
//  MVVMDemo
//
//  Created by rhc on 2016/01/04.
//  Copyright © 2016年 rhc. All rights reserved.
//

#ifndef UILayoutConst_h
#define UILayoutConst_h

#define kBase18Font                         ([UIFont systemFontOfSize:18])
#define kBase16Font                         ([UIFont systemFontOfSize:16])
#define kBase15Font                         ([UIFont systemFontOfSize:15])
#define kBase14Font                         ([UIFont systemFontOfSize:14])
#define kBase13Font                         ([UIFont systemFontOfSize:13])
#define kBase12Font                         ([UIFont systemFontOfSize:12])
#define kBase11Font                         ([UIFont systemFontOfSize:11])
#define kBase10Font                         ([UIFont systemFontOfSize:10])

#define kBaseGapToSuperView 10
#define kBaseHeadImageViewW 20

#define kBaseGapBetweenSubViews 8

#define kBaseAddressLabelW   30
#define kBaseAddressLabelH   15
#define kBaseBtnH            20
#define kBaseBtnW            80
#define kStatusAndNavHeight     64.0f
#define kBufferDurationSeconds 0.5

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kBaseCellWith           SCREEN_WIDTH
#define SAFE_RELEASE(x) [x release];x=nil

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"
#define kBaseRGBColor(r, g, b)  ([UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1])

#define IS_IOS7         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


#define RGB(A, B, C)        [UIColor colorWithRed:(A)/255.0 green:(B)/255.0 blue:(C)/255.0 alpha:1.0]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#endif /* UILayoutConst_h */
