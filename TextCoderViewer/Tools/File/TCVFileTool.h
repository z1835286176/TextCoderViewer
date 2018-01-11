//
//  TCVFileTool.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCVFileTool : NSObject

+ (void)getFileListsWithDirectoryName:(NSString *)dirName superPath:(NSString *)superPath CompleteHandler:(void (^)(NSString *completePath, NSArray *results))completeHandler;

@end
