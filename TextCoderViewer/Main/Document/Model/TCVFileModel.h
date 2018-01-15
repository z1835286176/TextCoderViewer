//
//  TCVFileModel.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TCVFileType) {
    TCVFileType_h,
    TCVFileType_m,
    TCVFileType_doc,
    TCVFileType_xls,
};

@interface TCVFileModel : NSObject

/** 当前文件名 */
@property (nonatomic, strong) NSString *name;
/** 是不是文件夹 */
@property (nonatomic, assign) BOOL isDir;
/** 文件类型 */
@property (nonatomic, assign) TCVFileType fileType;
/** 文件大小 */
@property (nonatomic, assign) NSUInteger size;
/** 绝对路径 */
@property (nonatomic, strong) NSString *absolutelyPath;
/** 上层文件夹名称 */
@property (nonatomic, strong) NSString *superDirName;
/** 上层文件夹路径 */
@property (nonatomic, strong) NSString *superDirPath;

- (instancetype)initWithName:(NSString *)name IsDirl:(BOOL)isDir;

+ (instancetype)fileModelWithName:(NSString *)name IsDirl:(BOOL)isDir;

@end
