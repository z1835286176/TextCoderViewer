//
//  PPAppOpeManager.h
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 提供一些普通的APP 操作 工具 */
@interface PPAppOpeManager : NSObject

/** 是否需要显示欢迎页面 */
+ (BOOL)needToShowWelcomePage;

/** 获取当前软件版本 已经有 一个宏定义了 kAPP_VERSION */
+ (NSString *)getCurrentAppVersion;
NSString *NSStringWithCurrentAppVersion(void);

/** 保存版本信息到本地 */
+ (BOOL)saveVersionToLocalPlist;

/** 判断是不是 第一次 打开软件 或者 更新 */
+ (BOOL)isFirstLaunchOrUpdateVersion;

@end
