
//
//  TCVDocumentViewController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVDocumentViewController.h"
#import "TCVFileListCell.h"

@interface TCVDocumentViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *linesM;

/** 该层的完整路径, 用于给下层的 superPath 使用 */
@property (nonatomic, strong) NSString *completePath;

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

- (NSMutableArray *)linesM {
    if(nil == _linesM) {
        _linesM = [NSMutableArray array];
    }
    return _linesM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.dirName.length > 0 ? self.dirName : @"文档";
    [self prepareData];
    [self createTableView];
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
    tableView.separatorStyle = 
    [self.view addSubview:tableView];
    self.tableView = tableView;
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
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
