//
//  TCVAppTool.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVAppTool.h"

@implementation TCVAppTool

singleton_implementation(TCVAppTool)


UIFont *UIFontWithBoldSize(CGFloat size) {
    return [UIFont boldSystemFontOfSize:size];
}

UIFont *UIFontSystemSizeFont(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

UIColor *SystemStyleColorInThisApp(void) {
    return [UIColor colorWithWholeRed:60 green:133 blue:206];
}

@end
