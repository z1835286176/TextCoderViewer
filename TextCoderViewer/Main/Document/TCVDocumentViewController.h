//
//  TCVDocumentViewController.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCVDocumentViewController : UIViewController

/** 所属的文件夹名称 */
@property (nonatomic, strong) NSString *dirName;

/** 所属文件夹的路径 */
@property (nonatomic, strong) NSString *superPath;

@end
