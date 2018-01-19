//
//  TCVServiceViewController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVServiceViewController.h"
#import "TCVServiceSupportedListVC.h"

@interface TCVServiceViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *linesM;

/** 更多操作按钮 */
@property (nonatomic, strong) UIBarButtonItem *addMoreItem;

@end

@implementation TCVServiceViewController

#pragma mark lazy load
- (NSMutableArray *)linesM {
    if(nil == _linesM) {
        _linesM = [NSMutableArray array];
    }
    return _linesM;
}

- (UIBarButtonItem *)addMoreItem {
    if(nil == _addMoreItem) {
        _addMoreItem = [[UIBarButtonItem alloc] initWithImage:UIImageWithImageName(@"PLUS") style:UIBarButtonItemStyleDone target:self action:@selector(showMoreOperation)];
    }
    return _addMoreItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务";
    [self setUpRightBarButtonItem];
    [self createTableView];
}

- (void)setUpRightBarButtonItem {
    self.navigationItem.rightBarButtonItem = self.addMoreItem;
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
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
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    [tableView setLayoutMargins:UIEdgeInsetsZero];
}

#pragma mark tableView delegate dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.linesM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark barButtonItem action
/** add 按钮 */
- (void)showMoreOperation {
    PPLog(@"%s", __FUNCTION__);
    
    TCVServiceSupportedListVC *listVC = [[TCVServiceSupportedListVC alloc] init];
    __weak_self;
    listVC.dismissBlock = ^(NSDictionary *info) {
        // 刷新界面 根据info传来的信息
        // if([info[@"isSelected"] boolValue]) 后面继续补充
        if([info[@"isSelected"] boolValue]) {
            [weakself.tableView reloadData];
        }
    };
    TCVNavigationController *navCon = [[TCVNavigationController alloc] initWithRootViewController:listVC];
    [self presentViewController:navCon animated:YES completion:nil];
}

@end
