//
//  PPDataManager.h
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark category DIYString of NSString
@interface NSString (DIYString)

NSString *NSStringWithNSInteger(NSInteger integer);
NSString *NSStringWithInteger(int integer);
NSString *NSStringWithFloat(float floatf);
NSString *NSStringWithDouble(double doubled);

/** 二选一的时候, 根据条件给出结果(数字型) */
NSString *NSStringWithCondition(NSInteger integer, NSInteger condition1, NSString *result1, NSInteger condition2, NSString *result2);
/** 二选一的时候, 根据条件给出结果(字符串型) */
NSString *NSStringWithConditionString(NSString *string, NSString *condition1, NSString *result1, NSString *condition2, NSString *result2);

/** 提供对象去处理数据 */
// 自定义输出字符串, 防止为nil
NSString *NSStringFromObj(id obj);
// 自定义输出字符串, 防止为nil
NSString *NSStringFromObjWithDefObj(id obj, id defObj);

/** 判断字符串是否介于 某一个范围, 1表示闭区间, 0表示开区间 */
BOOL NSStringIsInRange(NSString *string, NSInteger integerA, NSInteger integerB, BOOL equale);
@end

@interface PPDataManager : NSObject

#pragma mark 编码转码
/** unicode 转 utf-8 */
+ (NSString *)replaceUnicode:(NSString*)aUnicodeString;

/** 算一下 容量单位 */
+ (NSString *)checkByteIntervalWithGivenBytes:(NSUInteger)givenInteger;
@end
