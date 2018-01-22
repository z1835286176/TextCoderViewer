//
//  PPFileManager.h
//  PPManagers
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPFileManager : NSObject

/** 获取document等文件夹路径 */
NSString *NSStringOfDocumentDirectory(void);
+ (NSString *)getDocumentDirectory;

+ (NSString *)getPathInDocumentDirectoryWithComponent:(NSString *)pathComponent;

/** 检测文件夹是否存在, 不存在自动创建 */
+ (BOOL)checkDirectoryExistAutoCreateAtPath:(NSString *)path;

/** 检查文件夹是否存在, 不会自动创建 */
+ (BOOL)checkDirectoryExistAtPath:(NSString *)path;

/** 检查文件是不是文件夹 */
+ (BOOL)checkFileWhetherDirectory:(NSString *)filePath;
@end
