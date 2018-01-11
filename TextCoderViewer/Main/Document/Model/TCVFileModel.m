//
//  TCVFileModel.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVFileModel.h"

@implementation TCVFileModel

- (instancetype)initWithName:(NSString *)name IsDirl:(BOOL)isDir {
    if(self = [super init]) {
        self.name = name;
        self.isDir = isDir;
    }
    return self;
}

+ (instancetype)fileModelWithName:(NSString *)name IsDirl:(BOOL)isDir {
    return [[self alloc] initWithName:name IsDirl:isDir];
}

@end
