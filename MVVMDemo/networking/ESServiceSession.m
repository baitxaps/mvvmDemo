//
//  ESServiceSession.m
//  Seller
//
//  Created by rhc on 2017/01/04.
//  Copyright (c) 2017 Eelly.com. All rights reserved.
//

#import "ESServiceSession.h"
#import "Config.h"
#import "NSString+Encode.h"

#define kTokenChange @"ChangeToken"
#define appSecret @"#Xq!=aPB}M(gHMBQ>DrT;0{N<zAZf^dK"

@implementation ESServiceSession

+ (instancetype)sessionManager
{
    static ESServiceSession *_sessionManager = nil;
    
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        //  enable session cookie.
        sessionConfiguration.HTTPCookieStorage  = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        sessionConfiguration.HTTPShouldSetCookies   = YES;
        _sessionManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASEURL] sessionConfiguration:sessionConfiguration];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        NSURLCache *noCache   = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:0 diskPath:nil];
        [NSURLCache setSharedURLCache: noCache];
        [self setAuthTokenHeader:_sessionManager];
    });
    [self setAuthTokenSecretHeader:_sessionManager];
    return _sessionManager;
}

- (id)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)config
{
    self = [super initWithBaseURL:url sessionConfiguration:config];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenChanged:) name:kTokenChange object:nil];
    }
    
    return self;
}

+ (void)setAuthTokenHeader:(AFHTTPSessionManager *)sessionManager
{
    NSString *authToken = nil;//[[LoginRecord credentialStore] authToken];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    appVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    [sessionManager.requestSerializer setValue:authToken forHTTPHeaderField:@"Authorization"];
    [sessionManager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"appClient"];
    [sessionManager.requestSerializer setValue:appVersion forHTTPHeaderField:@"appVersion"];
    [sessionManager.requestSerializer setValue:@"buyer" forHTTPHeaderField:@"appType"];
}

+ (void)setAuthTokenSecretHeader:(AFHTTPSessionManager *)sessionManager
{
    NSString *time = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    appVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString *appSign = [NSString translateToMD5:[NSString stringWithFormat:@"%@iOS%@%@",appVersion,time,appSecret]];
    [sessionManager.requestSerializer setValue:time forHTTPHeaderField:@"appTimestamp"];
    [sessionManager.requestSerializer setValue:appSign forHTTPHeaderField:@"appSign"];
}

- (void)tokenChanged:(NSNotification *)notification
{
//NSString *authToken = [[LoginRecord credentialStore] authToken];
  //  debugLog(@"tokenChanged: new authToken ==> %@", authToken);
  //  [self.requestSerializer setValue:authToken forHTTPHeaderField:@"Authorization"];
}

- (void)clearSessionHeader
{
    [self.requestSerializer setValue:@"" forHTTPHeaderField:@"Authorization"];
    [self.operationQueue cancelAllOperations];
}

@end
