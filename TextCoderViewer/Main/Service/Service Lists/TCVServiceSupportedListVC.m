
//
//  TCVServiceSupportedListVC.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVServiceSupportedListVC.h"
#import "TCVServiceSupportedCell.h"

@interface TCVServiceSupportedListVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *supportedServiceList;

@property (nonatomic, strong) TCVServiceSupportedModel *selectedServiceSModel;
@end

@implementation TCVServiceSupportedListVC

- (NSArray *)supportedServiceList {
    if(nil == _supportedServiceList) {
        _supportedServiceList = [TCVAccountTool AllServiceSupportedLists];
    }
    return _supportedServiceList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加服务";
    [self setUpRightBarButtonItem];
    [self createTableView];
}

- (void)setUpRightBarButtonItem {
    UIBarButtonItem *completeBarItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(completeBarButtonClick)];
    self.navigationItem.rightBarButtonItem = completeBarItem;
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    // tableView.tableFooterView = [[UIView alloc] init]; // 这个用途是: 有数据的部分有分割线, 没数据的部分 全是空白
    
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
//    [tableView setSeparatorInset:UIEdgeInsetsZero];
//    [tableView setLayoutMargins:UIEdgeInsetsZero];
}

#pragma mark tableView delegate dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.supportedServiceList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TCVServiceSupportedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TCVServiceSupportedCell class])];
    if(nil == cell) {
        cell = [[TCVServiceSupportedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([TCVServiceSupportedCell class])];
    }
    
    cell.serviceSupportedModel = self.supportedServiceList[indexPath.section];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedServiceSModel = self.supportedServiceList[indexPath.section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

#pragma mark complete button click
- (void)completeBarButtonClick {
    __weak_self;
    [self dismissViewControllerAnimated:YES completion:^{
#warning 一旦新建 成功的连接, 这边就给account赋值
        // 前一个页面刷新数据
        NSDictionary *selectedInfo = @{@"isSelected" : nil == self.selectedServiceSModel ? @"NO" : @"YES",
                                       @"serviceType" : @(self.selectedServiceSModel.type),
                                       @"account" : @{},
                                       };
        weakself.dismissBlock(selectedInfo);
    }];
}
@end
