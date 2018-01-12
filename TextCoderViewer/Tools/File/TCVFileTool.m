//
//  TCVFileTool.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVFileTool.h"

@implementation TCVFileTool

+ (NSString *)getPathInDocumentDirectoryWithComponent:(NSString *)pathName {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]; //lastObject
    return pathName.length > 0 ? [documentPath stringByAppendingPathComponent:pathName] : documentPath;
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

+ (BOOL)checkFileWhetherDirectory:(NSString *)filePath {
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir];
    return isDir;
}



+ (void)getFileListsWithDirectoryName:(NSString *)dirName superPath:(NSString *)superPath CompleteHandler:(void (^)(NSString *, NSArray *))completeHandler {
    // 路径
    NSString *directoriesPath = @"";
    if(superPath.length == 0) {
        directoriesPath = [self getPathInDocumentDirectoryWithComponent:dirName];
    } else {
        directoriesPath = [superPath stringByAppendingPathComponent:dirName];
    }
    
    if(directoriesPath.length == 0) {
        return;
    }
    
    BOOL dirExist = [self checkDirectoryExistAtPath:directoriesPath];
    if(!dirExist) {
        NSLog(@"文件夹不存在:%@", directoriesPath);
        return;
    }
    
    NSError *error = nil;
    
    // 只返回文件夹名
    NSMutableArray *resultes = [NSMutableArray array];
    NSArray *contentArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoriesPath error:&error];//不显示子文件
    for(NSString *name in contentArray) {
        if([[name substringToIndex:1] isEqualToString:@"."]) {
            // 隐藏文件过滤掉不显示
            continue;
        }
        NSString *filePath = [directoriesPath stringByAppendingPathComponent:name];
        BOOL isDir = [self checkFileWhetherDirectory:filePath];
        // NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:directoriesPath error:&error];
        // NSLog(@"%@", dictionary);
        TCVFileModel *fileModel = [TCVFileModel fileModelWithName:name IsDirl:isDir];
        [resultes addObject:fileModel];
    }
    completeHandler(directoriesPath, resultes);
}

@end
