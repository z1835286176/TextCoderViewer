
//
//  PPDateManager.m
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "PPDateManager.h"

@implementation PPDateManager

NSString *NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZ(NSDate *date) {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置日期格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *year = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *day =  [dateFormatter stringFromDate:date];
    return [[[year stringByAppendingString:@"T"] stringByAppendingString:day] stringByAppendingString:@"Z"];
}

NSString *NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZSinceCurrent() {
    return NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZ([NSDate date]);
}

NSString *NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZSince1970WithTimeInterval(NSInteger sinceTime) {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:sinceTime];
    return NSStringWithFormat_yyyy_MM_ddTHH_mm_ssZ(date);
}

NSString *NSStringWithFormat_yyyy_MM_dd_HH_mm_ss(NSDate *date) {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置日期格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

NSString *NSStringWithFormat_yyyy_MM_dd_HH_mm_ssSinceCurrent() {
    return NSStringWithFormat_yyyy_MM_dd_HH_mm_ss([NSDate date]);
}

NSString *NSStringWithFormat_yyyy_MM_dd_HH_mm_ssSince1970WithTimeInterval(NSInteger sinceTime) {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:sinceTime / 1000];
    return NSStringWithFormat_yyyy_MM_dd_HH_mm_ss(date);
}

+ (NSString *)createDatewithTimeInterval:(long long)date { // 1000 倍
    NSDate *dateTime = [[NSDate alloc] initWithTimeIntervalSince1970:date/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    NSLocale *formatterLocal = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
    [formatter setLocale:formatterLocal];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    return [formatter stringFromDate:dateTime];
}

/** 根据提供的时间 换算间隔多少时间 */
+ (NSString *)checkTimeIntervalSinceGivenDate:(NSDate *)sinceDate {
    
    double secoInterval = [[NSDate date] timeIntervalSinceDate:sinceDate];
    if(secoInterval < 60.0) {
        return [NSString stringWithFormat:@"%d秒前", (int)secoInterval];
    }
    
    double minuInterval = secoInterval / 60.0;
    if(minuInterval < 60.0){
        return [NSString stringWithFormat:@"%d分钟前", (int)minuInterval];
    }
    
    double hourInterval = minuInterval / 60.0;
    if(hourInterval < 24.0) {
        return [NSString stringWithFormat:@"%d小时前", (int)hourInterval];
    }
    
    double dayInterval = hourInterval / 24.0;
    if(dayInterval < 30.0) {
        return [NSString stringWithFormat:@"%d天前", (int)dayInterval];
    }
    
    double montInteval = dayInterval / 30.0; // 一个月按30天记
    if(montInteval < 12.0) {
        return [NSString stringWithFormat:@"%d个月前", (int)montInteval];
    }
    
    double yearInteval = montInteval / 12.0; // 一个月按30天记
    return [NSString stringWithFormat:@"%d年前", (int)yearInteval];
}

@end
