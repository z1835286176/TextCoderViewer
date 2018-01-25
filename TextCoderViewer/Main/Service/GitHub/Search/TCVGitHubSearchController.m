//
//  TCVGitHubSearchController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubSearchController.h"

@interface TCVGitHubSearchController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@property (nonatomic, strong) NSMutableArray *resultsMArray;

@end

@implementation TCVGitHubSearchController

- (UITableView *)tableView {
    if(nil == _tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 70) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (UIActivityIndicatorView *)indicatorView {
    if(nil == _indicatorView) {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [indicatorView setCenter:CGPointMake(0.5 * self.view.frame.size.width, 35 + 0.5 * self.view.frame.size.width)];
        
        [self.view addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (NSMutableArray *)resultsMArray {
    if(nil == _resultsMArray) {
        _resultsMArray = [NSMutableArray array];
    }
    return _resultsMArray;
}

- (instancetype)initWithParentController:(UIViewController *)parentController {
    if(self = [super init]) {
        [parentController addChildViewController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpTopView];
}

- (void)setUpTopView {

    UIColor *backColor = [UIColor colorWithWholeRed:249 green:249 blue:249];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 69.6)];
    [backView setBackgroundColor:backColor];
    [self.view addSubview:backView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 69.6, self.view.frame.size.width, 0.4)];
    [line setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:line];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 23, self.view.frame.size.width, 40)];//
    _searchBar.placeholder = @"搜索 GitHub";
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    _searchBar.barTintColor = backColor;
    
    for (UIView *subView in _searchBar.subviews) {
        if ([subView isKindOfClass:[UIView  class]]) {
            [[subView.subviews objectAtIndex:0] removeFromSuperview];
        }
    }
    [backView addSubview:_searchBar];
    
    UIButton *cancleBtn = [_searchBar valueForKey:@"_cancelButton"];
    [cancleBtn setTintColor:[UIColor colorWithWholeRed:49 green:126 blue:244]];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.enabled = YES;
}

#pragma mark tableView delegate, dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultsMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.resultsMArray[indexPath.row][@"full_name"];
    return cell;
}

#pragma mark UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    // 取消按钮
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(willDismissSearchController:)]) {
        [self.delegate willDismissSearchController:self];
    }
    [self removeFromParentViewController];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(didDismissSearchController:)]) {
        [self.delegate didDismissSearchController:self];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // 键盘的搜索按钮
    
    // 获取当前输入的文字
    NSString *searchContent = searchBar.text;
    if(searchContent.length > 0) {
        // 只有文字长度大于0 才可以搜索
        
        // 只要开始搜索, tableview的数据就要隐藏
        self.tableView.hidden = YES;
        self.indicatorView.hidden = NO;
        
        [self.indicatorView startAnimating];
        // 开始查数据
        NSDictionary *params = @{@"q" : searchContent,
                                 @"order" : @"asc",
                                 @"per_page" : @"100",
                                 };
        [TCVGitHubApiSDK queryRepositoriesWithParameters:params success:^(NSArray *results) {
            // 查到数据之后
            self.tableView.hidden = NO;
            self.indicatorView.hidden = YES;
            
            [self.resultsMArray removeAllObjects];
            
            [self.resultsMArray addObjectsFromArray:results];
            
            // 显示数据
            
            [self.tableView reloadData];
        } fail:^(NSError *error) {
            
        }];
        
    } else {
        return;
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if(searchText.length == 0) {
        self.tableView.hidden = YES;
        self.indicatorView.hidden = YES;
    }
}

@end
