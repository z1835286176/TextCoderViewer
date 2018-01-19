//
//  TCVFileTool.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVFileTool.h"

@implementation TCVFileTool
singleton_implementation(TCVFileTool)

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
            PPLog(@"%@", createDirError);
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
    NSString *directoriesPath = [self getPathInDocumentDirectoryWithComponent:superPath];
    
    PPLog(@"%@", directoriesPath);
    
    if(directoriesPath.length == 0) {
        return;
    }
    
    BOOL dirExist = [self checkDirectoryExistAtPath:directoriesPath];
    if(!dirExist) {
        PPLog(@"文件夹不存在:%@", directoriesPath);
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
        // BOOL isDir = [self checkFileWhetherDirectory:filePath];
        NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
        // PPLog(@"%@", dictionary);
        
        TCVFileModel *fileModel = [[TCVFileModel alloc] init];
        fileModel.name = name;
        fileModel.superDirName = dirName;
        fileModel.superDirRelativePath = superPath;
        fileModel.relativePath = [superPath stringByAppendingPathComponent:name];
        fileModel.size = [dictionary fileSize];
        fileModel.modificationDate = [dictionary fileModificationDate]; // 取文件修改时间
        fileModel.isDir = [[dictionary fileType] isEqualToString:@"NSFileTypeDirectory"];
        
        [resultes addObject:fileModel];
    }
    completeHandler([superPath stringByAppendingString:dirName], resultes);
}

@end
