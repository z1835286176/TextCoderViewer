
//
//  TCVDocumentViewController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVDocumentViewController.h"
#import "TCVFileListCell.h"

/** condition of the documentView, normal or editing */
typedef NS_ENUM(NSInteger, TCVDocumentConditionStyle) {
    TCVDocumentConditionStyleNormal = 1,
    TCVDocumentConditionStyleEditing,
};

@interface TCVDocumentViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** 更多操作按钮 */
@property (nonatomic, strong) UIBarButtonItem *addMoreItem;
/** 编辑按钮 */
@property (nonatomic, strong) UIBarButtonItem *editItem;

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *linesM;

/** 编辑模式下的被选中数据源 */
@property (nonatomic, strong) NSMutableArray *linesMSeled;

/** 该层的完整路径, 用于给下层的 superPath 使用 */
@property (nonatomic, strong) NSString *completePath;

@property (nonatomic, assign) TCVDocumentConditionStyle documentConditionStyle;

@end

@implementation TCVDocumentViewController

#pragma mark lazy load
- (NSString *)dirName {
    if(nil == _dirName) {
        _dirName = @"";
    }
    return _dirName;
}

- (NSString *)superPath {
    if(nil == _superPath) {
        _superPath = @"";
    }
    return _superPath;
}

- (UIBarButtonItem *)addMoreItem {
    if(nil == _addMoreItem) {
        _addMoreItem = [[UIBarButtonItem alloc] initWithImage:UIImageWithImageName(@"PLUS") style:UIBarButtonItemStyleDone target:self action:@selector(showMoreOperation)];
    }
    return _addMoreItem;
}

- (UIBarButtonItem *)editItem {
    if(nil == _editItem) {
        _editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editAllCells)];
    }
    return _editItem;
}

- (NSMutableArray *)linesM {
    if(nil == _linesM) {
        _linesM = [NSMutableArray array];
    }
    return _linesM;
}

- (NSMutableArray *)linesMSeled {
    if(nil == _linesMSeled) {
        _linesMSeled = [NSMutableArray array];
    }
    return _linesMSeled;
}

- (TCVDocumentConditionStyle)documentConditionStyle {
    if(_documentConditionStyle > 0) {
        return _documentConditionStyle;
    } else {
        return TCVDocumentConditionStyleNormal;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.dirName.length > 0 ? self.dirName : @"文档";
    [self setUpBackBarButtonItem];
    [self setUpRightBarButtonItems];
    [self prepareData];
    [self createTableView];
}

- (void)setUpBackBarButtonItem {
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"返回";
    self.navigationItem.backBarButtonItem = backBtn;
    // 注意这里的self是父ViewController,不是即将显示的子ViewController
}

- (void)setUpRightBarButtonItems {
    self.navigationItem.rightBarButtonItems = self.documentConditionStyle == TCVDocumentConditionStyleNormal ? @[self.editItem, self.addMoreItem] : @[self.editItem];
}


- (void)prepareData {
    if(self.linesM.count == 0) {
        [TCVFileTool getFileListsWithDirectoryName:self.dirName superPath:self.superPath CompleteHandler:^(NSString *completePath, NSArray *results) {
            if(completePath.length > 0) {
                self.completePath = completePath;
            }
            if(results.count > 0) {
                [self.linesM removeAllObjects];
                [self.linesM addObjectsFromArray:results];
                [self.tableView reloadData];
            }
        }];
    }
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.tableFooterView = [[UIView alloc] init]; // 这个用途是: 有数据的部分有分割线, 没数据的部分 全是空白
    
    /** 方法A
     *  设置self.tableView 分割线距离左右都是0
     *  方法B 实现下面的方法
     // 移除iOS7之后，cell默认左侧的分割线边距
     //- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
     //    cell.layoutMargins = UIEdgeInsetsZero;
     //    cell.separatorInset = UIEdgeInsetsZero;
     //    cell.preservesSuperviewLayoutMargins = NO;
     //}
     */
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
}

#pragma mark tableView delegate dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.linesM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TCVFileListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TCVFileListCell class])];
    if(nil == cell) {
        cell = [[TCVFileListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([TCVFileListCell class])];
    }
    
    TCVFileModel *fileModel = self.linesM[indexPath.row];
    cell.fileModel = fileModel;
    
    if(self.documentConditionStyle == TCVDocumentConditionStyleEditing) {
        cell.isSeled = [self.linesMSeled containsObject:fileModel];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TCVFileModel *fileModel = self.linesM[indexPath.row];
    if(self.documentConditionStyle == TCVDocumentConditionStyleNormal) {
        
        // 普通模式
        if(fileModel.isDir) {
            // 如果是文件夹, 跳转到下一页面并显示
            TCVDocumentViewController *documentVC = [[TCVDocumentViewController alloc] init];
            documentVC.dirName = fileModel.name;
            documentVC.superPath = self.completePath;
            [self.navigationController pushViewController:documentVC animated:YES];
        }
    } else {
        // 编辑模式
        // 点击之后加到数组中
        NSLog(@"点击之后加到数组中");
        TCVFileListCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if([self.linesMSeled containsObject:fileModel]) {
            [self.linesMSeled removeObject:fileModel];
            cell.isSeled = NO;
        } else {
            [self.linesMSeled addObject:fileModel];
            cell.isSeled = YES;
        }
    }
}

#pragma mark barButtonItem action
/** add 按钮 */
- (void)showMoreOperation {
    NSLog(@"%s", __FUNCTION__);
    [self documentsetEditStatus:NO];
}

/** 编辑按钮 */
- (void)editAllCells {
    NSLog(@"%s", __FUNCTION__);
    
    self.documentConditionStyle = 3 - self.documentConditionStyle;
    /** 切换编辑形式, 这个编辑就不用 tableView的编辑了, 直接自己实现就OK
     *  tableView的编辑形式会把cell.contentView的位置改变, 不需要
     */
    [self documentsetEditStatus:self.documentConditionStyle == TCVDocumentConditionStyleEditing];
        
}

/** 切换编辑模式 */
- (void)documentsetEditStatus:(BOOL)editing {
    
    // 保守起见, 设置一遍self.documentConditionStyle = TCVDocumentConditionStyleEditing
    self.documentConditionStyle = editing ? TCVDocumentConditionStyleEditing : TCVDocumentConditionStyleNormal;
    
    [self setUpRightBarButtonItems];
    
    self.tabBarController.tabBar.hidden = editing;
    self.editItem.title = editing ? @"完成" : @"编辑";
    NSInteger count = self.linesM.count;
    for(NSInteger index = 0; index < count; index ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        TCVFileListCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [cell beganToEdit:editing];
    }
    
    if(editing) {
        [self.linesMSeled removeAllObjects];
    }
}
@end
