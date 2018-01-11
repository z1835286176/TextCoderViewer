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

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) BOOL isDir;

@property (nonatomic, assign) TCVFileType fileType;

@property (nonatomic, assign) NSUInteger size;

@property (nonatomic, strong) NSString *superDir;

- (instancetype)initWithName:(NSString *)name IsDirl:(BOOL)isDir;

+ (instancetype)fileModelWithName:(NSString *)name IsDirl:(BOOL)isDir;

@end
