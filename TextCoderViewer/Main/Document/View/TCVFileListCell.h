//
//  TCVFileListCell.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCVFileListCell : UITableViewCell

@property (nonatomic, strong) TCVFileModel *fileModel;

/** 编辑模式 */
- (void)beganToEdit:(BOOL)isEditing;

/** 是否选中 */
@property (nonatomic, assign) BOOL isSeled;
@end
