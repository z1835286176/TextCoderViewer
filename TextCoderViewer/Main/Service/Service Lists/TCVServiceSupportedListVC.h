//
//  TCVServiceSupportedListVC.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DismissBlock)(NSDictionary *info);

@interface TCVServiceSupportedListVC : UIViewController

@property (nonatomic, strong) DismissBlock dismissBlock;

@end
