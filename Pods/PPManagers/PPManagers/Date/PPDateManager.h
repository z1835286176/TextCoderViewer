//
//  PPDateManager.h
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPDateManager : NSObject

NSString *NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZ(NSDate *date);
NSString *NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZSinceCurrent(void);
NSString *NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZSince1970WithTimeInterval(NSInteger sinceTime);
NSString *NSStringWithFormat_yyyy_MM_dd_HH_mm_ss(NSDate *date);
NSString *NSStringWithFormat_yyyy_MM_dd_HH_mm_ssSinceCurrent(void);
NSString *NSStringWithFormat_yyyy_MM_dd_HH_mm_ssSince1970WithTimeInterval(NSInteger sinceTime);

+ (NSString *)createDatewithTimeInterval:(long long)date;

/** 根据提供的时间 换算间隔多少时间 */
+ (NSString *)checkTimeIntervalSinceGivenDate:(NSDate *)sinceDate;
@end
