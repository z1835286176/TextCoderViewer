//
//  TCVFileTool.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface TCVFileTool : NSObject
singleton_interface(TCVFileTool)
+ (void)getFileListsWithDirectoryName:(NSString *)dirName superPath:(NSString *)superPath CompleteHandler:(void (^)(NSString *completePath, NSArray *results))completeHandler;

@end
