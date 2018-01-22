//
//  PPColorManager.h
//  PPManagers
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark category HEX of UIColor
@interface UIColor (HEX)
/**
 *  由16进制颜色格式生成UIColor
 *
 *  @param hex 16进制颜色0x00FF00
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex;
/**
 *  由16进制颜色格式生成UIColor
 *
 *  @param hex 16进制颜色0x00FF00
 *  @param alpha 透明
 *
 *  @return Color
 */
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
/**
 *  由16进制颜色字符串格式生成UIColor
 *
 *  @param hexString 16进制颜色#00FF00
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  生成当前颜色的16进制字符串
 *
 *  @return 16进制字符串
 */
- (NSString *)HEXString;

+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@end

@interface PPColorManager : UIColor

@end
