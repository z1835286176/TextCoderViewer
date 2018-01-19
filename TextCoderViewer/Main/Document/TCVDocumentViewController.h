//
//  TCVDocumentViewController.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning 参考的人家的软件写的, 现在有几个问题
/** 问题汇总
 *  1. 界面打开速度
        // prepareData 放到 viewWillAppear就好了
 */


@interface TCVDocumentViewController : UIViewController

/** 所属的文件夹名称 */
@property (nonatomic, strong) NSString *dirName;

/** 所属文件夹的路径 */
@property (nonatomic, strong) NSString *superPath;

@end
