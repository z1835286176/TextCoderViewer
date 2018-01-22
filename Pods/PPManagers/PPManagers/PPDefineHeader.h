//
//  PPDefineHeader.h
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

/**
 *  仅用作 宏定义相关的
 */
#ifndef PPDefineHeader_h
#define PPDefineHeader_h

// base header

// category

// manager


#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define PPLog(...) NSLog(__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define PPLog(...)
#endif

// View
#define PPWindowBounds [UIScreen mainScreen].bounds
#define PPWindowSize [UIScreen mainScreen].bounds.size
#define PPWindowWidth [UIScreen mainScreen].bounds.size.width
#define PPWindowHeight [UIScreen mainScreen].bounds.size.height

// retain
#define __weak_self             __typeof__(self) __weak weakself = self;
#define __weak_other(other)     __typeof__(other) __weak weakother = other;
#define __strong_self           __strong __typeof(weakself) strongSelf = weakself

// app
#define PPAPP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#endif /* PPDefineHeader_h */
