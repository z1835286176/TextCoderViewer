//
//  PPAppOpeManager.m
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "PPAppOpeManager.h"

@implementation PPAppOpeManager


/** 是否需要显示欢迎页面 */
+ (BOOL)needToShowWelcomePage {
    return [self isFirstLaunchOrUpdateVersion];
}

/** 获取当前软件版本 已经有 一个宏定义了 kAPP_VERSION */
+ (NSString *)getCurrentAppVersion {
    return NSStringWithCurrentAppVersion();
}

NSString *NSStringWithCurrentAppVersion(void) {
    return [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
}

/** 保存版本信息到本地 */
+ (BOOL)saveVersionToLocalPlist {
    [[NSUserDefaults standardUserDefaults] setObject:[self getCurrentAppVersion] forKey:@"appVersion"];
    return YES;
}

/** 判断是不是 第一次 打开软件 或者 更新 */
+ (BOOL)isFirstLaunchOrUpdateVersion {
    //获取上次启动应用保存的appVersion
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:@"appVersion"];
    if(version && [version isEqualToString:[self getCurrentAppVersion]]) {
        return NO;
    } else {
        return YES;
    }
}

@end
