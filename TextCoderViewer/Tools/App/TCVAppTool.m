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

@end
