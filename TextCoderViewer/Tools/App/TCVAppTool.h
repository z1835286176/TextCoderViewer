//
//  TCVAppTool.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface TCVAppTool : NSObject

singleton_interface(TCVAppTool)

UIFont *UIFontWithBoldSize(CGFloat size);
UIFont *UIFontSystemSizeFont(CGFloat size);

UIColor *SystemStyleColorInThisApp(void);

@end
