//
//  PPFileManager.m
//  PPManagers
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "PPFileManager.h"

@implementation PPFileManager

/** 获取document等文件夹路径 */
NSString *NSStringOfDocumentDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)getDocumentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)getPathInDocumentDirectoryWithComponent:(NSString *)pathComponent {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]; //lastObject
    return pathComponent.length > 0 ? [documentPath stringByAppendingPathComponent:pathComponent] : documentPath;
}

/** 检测文件夹是否存在, 不存在自动创建 */
+ (BOOL)checkDirectoryExistAutoCreateAtPath:(NSString *)path {
    BOOL isDir = YES;
    BOOL dirExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    NSError *createDirError = nil;
    if(dirExist) {
        return YES;
    } else {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&createDirError];
        if(createDirError) {
            NSLog(@"%@", createDirError);
            return NO;
        } else {
            return YES;
        }
    }
}

/** 检查文件夹是否存在, 不会自动创建 */
+ (BOOL)checkDirectoryExistAtPath:(NSString *)path {
    BOOL isDir = YES;
    BOOL dirExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    return dirExist;
}

/** 检查文件是不是文件夹 */
+ (BOOL)checkFileWhetherDirectory:(NSString *)filePath {
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir];
    return isDir;
}

@end
