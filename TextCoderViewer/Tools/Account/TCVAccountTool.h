//
//  TCVAccountTool.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCVServiceSupportedModel.h"
#import "TCVAccount.h"

#import "TCVAccountOfGithub.h"

@interface TCVAccountTool : NSObject

/** 支持的可连接列表 */
+ (NSArray *)AllServiceSupportedLists;

/** 所有已经保存的连接列表 */
+ (NSArray<TCVAccount *> *)AllAccountConnects;

/** 保存可用的连接列表 */
+ (BOOL)saveAccountConnect:(NSDictionary *)accountConnect accountConnectType:(TCVServiceSupportedTypes)serviceSupportedType;

@end
