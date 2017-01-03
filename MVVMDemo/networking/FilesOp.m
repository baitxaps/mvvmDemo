//
//  FilesOp.m
//  Block
//
//  Created by hairong chen on 2016/12/24.
//  Copyright © 2016年 hairong chen. All rights reserved.
//

#import "FilesOp.h"

@implementation FilesOp

+ (NSString *)filePathForType:(NSInteger)type {
    NSString *f = @"";
    if (type ==1) {
        f = @"/Users/rhc/Desktop/文档/list.json";
        
    }else if (type == 2) {
        f = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle] bundlePath],@"/list.json" ];
        
    }else {
        NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path= [documents objectAtIndex:0];
        f = [path stringByAppendingPathComponent:@"list.json"];
    }
    return f;
}

+ (void )saveResp:(id)data type:(NSInteger)t {
    NSInteger type = t;
    NSString *f = [self filePathForType:type];
    
    BOOL isYes = [NSJSONSerialization isValidJSONObject:data];
    NSData *jsonData = nil;
    if (isYes &&( type ==1 ||type ==2)) {
        jsonData = [NSJSONSerialization dataWithJSONObject:data options:0 error:NULL];
        [jsonData writeToFile:f atomically:YES];
        
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        NSLog(@"保存地址=%@>>>>>>>>\n", f);
    } else if(isYes){
        
        NSFileManager *fm = [NSFileManager defaultManager];
        if ([fm createFileAtPath:f contents:nil attributes:nil] ==YES) {
            NSError *error;
            BOOL success = [jsonData writeToFile:f options:0 error:&error];
            if (!success) {
                NSLog(@"writeToFile failed with error %@", error);
            }
        }
    }else {
        NSLog(@"JSON数据生成失败，请检查数据格式");
    }
}

+ (id)loadResp :(NSString*)fileName {
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@",res);
    
    return res;
}

@end
