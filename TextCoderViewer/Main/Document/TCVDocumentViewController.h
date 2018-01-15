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
        该项目打开明显有个停顿时间, 原生的没有
        猜测: 别人应该是用的本地数据库显示纯数据, 没有立即去本地用NSFileManager获取文件信息(可能性极大)
            数据一旦变动, 立即更新数据库, 然后显示, 速度会比全部重新获取要快很多(后面的主要工作)
        辅助功能, 它的启动页面明显时间过长, 可能在初始化那边做了不少工作, 咱先不管
        假使使用数据库实现, 一层一层获取这个思路是不变的, 然后在没有数据的时候应该怎么办?
        这时候数据库没有数据的(但是它明显没有迟钝)
        辅助以二次加载, 就是当当前页面数据获取到的时候, 顺便在后台获取一下后面的数据, 虽然笨, 但是有用的应该
        这样第一次打开APP时间花费就是: 页面启动 + 第一遍获取数据 + 显示数据
        次级页面的加载时间: 数据库获取数据 + 显示数据
        后台获取次级页面数据 + 存数据库
 */


@interface TCVDocumentViewController : UIViewController

/** 所属的文件夹名称 */
@property (nonatomic, strong) NSString *dirName;

/** 所属文件夹的路径 */
@property (nonatomic, strong) NSString *superPath;

@end
