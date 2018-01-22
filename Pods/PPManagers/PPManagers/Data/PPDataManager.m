//
//  PPDataManager.m
//  PPCalendar
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "PPDataManager.h"

#pragma mark category Log of NSDictionary
@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{\n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [str appendString:@"}"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}
@end

#pragma mark category Log of NSArray
@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"[\n"];
    
    // 遍历数组的所有元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [str appendFormat:@"%@,\n", obj];
    }];
    
    [str appendString:@"]"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}

@end

#pragma mark category DIYString of NSString
@implementation NSString (DIYString)

NSString *NSStringWithNSInteger(NSInteger integer) {
    if(!integer) {
        integer = 0;
    }
    return [NSString stringWithFormat:@"%ld", integer];
}
NSString *NSStringWithInteger(int integer) {
    if(!integer) {
        integer = 0;
    }
    return [NSString stringWithFormat:@"%d", integer];
}
NSString *NSStringWithFloat(float floatf) {
    if(!floatf) {
        floatf = 0.0;
    }
    return [NSString stringWithFormat:@"%f", floatf];
}
NSString *NSStringWithDouble(double doubled) {
    if(!doubled) {
        doubled = 0.0;
    }
    return [NSString stringWithFormat:@"%f", doubled];
}

/** 二选一的时候, 根据条件给出结果 */
NSString *NSStringWithCondition(NSInteger integer, NSInteger condition1, NSString *result1, NSInteger condition2, NSString *result2) {
    if(integer == condition1) {
        return result1;
    } else if (integer == condition2) {
        return result2;
    } else {
        return @"";
    }
}

/** 二选一的时候, 根据条件给出结果(字符串型) */
NSString *NSStringWithConditionString(NSString *string, NSString *condition1, NSString *result1, NSString *condition2, NSString *result2) {
    if([string isEqualToString:condition1]) {
        return result1;
    } else if([string isEqualToString:condition2]) {
        return result2;
    } else {
        return @"";
    }
}

/** 提供对象去处理数据 */
NSString *NSStringFromObj(id obj) {
    if(nil == obj) {
        return @"";
    } else {
        if([obj isKindOfClass:[NSString class]]) {
            return obj;
        } else {
            NSObject *object = obj;
            return object.description;
        }
    }
}

// 自定义输出字符串, 防止为nil
NSString *NSStringFromObjWithDefObj(id obj, id defObj) {
    if(nil == obj) {
        return defObj;
    } else {
        if([obj isKindOfClass:[NSString class]]) {
            return obj;
        } else {
            NSObject *object = obj;
            return object.description;
        }
    }
}

/** 判断字符串是否介于 某一个范围, 1表示闭区间, 0表示开区间 */
BOOL NSStringIsInRange(NSString *string, NSInteger integerA, NSInteger integerB, BOOL equale) {
    if(equale) {
        if([string integerValue] >= integerA && [string integerValue] <= integerB) {
            return YES;
        } else {
            return NO;
        }
    } else {
        if([string integerValue] > integerA && [string integerValue] < integerB) {
            return YES;
        } else {
            return NO;
        }
    }
}

@end

@implementation PPDataManager

#pragma mark 编码转码
/** unicode 转 utf-8 */
+ (NSString *)replaceUnicode:(NSString*)aUnicodeString {
    NSString *tempStr1 = [aUnicodeString stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:nil];
    // [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL]; // iOS 8.0
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

/** 算一下 容量单位 */
+ (NSString *)checkByteIntervalWithGivenBytes:(NSUInteger)givenInteger {
    if(givenInteger < 1024) {
        return [NSString stringWithFormat:@"%lu字节", (unsigned long)givenInteger];
    }
    
    NSUInteger kInteger = givenInteger / 1024;
    if(kInteger < 1024) {
        return [NSString stringWithFormat:@"%luKB", (unsigned long)kInteger];
    }
    
    NSUInteger mInteger = kInteger / 1024;
    if(mInteger < 1024) {
        return [NSString stringWithFormat:@"%luMB", (unsigned long)mInteger];
    }
    
    NSUInteger gInteger = mInteger / 1024;
    if(gInteger < 1024) {
        return [NSString stringWithFormat:@"%luGB", (unsigned long)gInteger];
    }
    
    NSUInteger tInteger = gInteger / 1024;
    // 手机存储...1T已经超级大了...
    return [NSString stringWithFormat:@"%luTB", (unsigned long)tInteger];
}
@end
