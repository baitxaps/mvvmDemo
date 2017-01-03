//
//  Config.h
//  MVVMDemo
//
//  Created by rhc on 2017/01/04.
//  Copyright © 2017年 rhc. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define appSecret @"#Xq!=aPB}M(gHMBQ>DrT;0{N<zAZf^dK"
#define API_TOKEN_IOS @"%HdoQqwI3sQ3bBnaLReX^hMp"
#define CurrentVersionNumberWithAndriod @"10200"

// 服务系统
#define Customer_System @"Mall"
// 服务器的status code
#define STATUS_CODE_TOKEN_EXPIRED    231502// token过期
#define STATUS_CODE_SUCCESS           0

//首页
#define BASEURL    @"http://pifaquan.eelly.com/"
#define HOME_HOMEURL @"api/index/buyerIndex"


#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#define debugObj(obj) NSLog(@"%s:%@", #obj, obj)
#else
#define debugLog(...)
#define debugMethod()
#define debugObj(Obj)
#endif

#endif /* Config_h */
