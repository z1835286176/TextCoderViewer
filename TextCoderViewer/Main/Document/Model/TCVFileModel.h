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
/** 文件修改时间 */
@property (nonatomic, strong) NSDate *modificationDate;
/** 相对于Documents的路径 */
@property (nonatomic, strong) NSString *relativePath;
/** 上层文件夹名称 */
@property (nonatomic, strong) NSString *superDirName;
/** 上层文件夹相对于Documents的路径 */
@property (nonatomic, strong) NSString *superDirRelativePath;

@end
