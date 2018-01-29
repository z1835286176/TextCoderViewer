//
//  TCVGitHubViewController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubViewController.h"
#import "TCVGitHubRepositoriesController.h"

@interface TCVGitHubViewController () <UITableViewDelegate, UITableViewDataSource, TCVGitHubRepositoriesControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

/** 点击searchBar之后, 设置searchController为当前控制器的子控制器 */
//@property (nonatomic, strong) TCVGitHubSearchController *searchController;
/** 点击searchBar之后, 整个searchBar就依附在这个view上面 */
@property (nonatomic, strong) UIView *wholeView;

@end

@implementation TCVGitHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GitHub";
    [self createTableView];
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark tableView delegate dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    switch (indexPath.section) {
        case 0: {
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:cell.contentView.bounds];
            searchBar.placeholder = @"搜索 GitHub";
            searchBar.barTintColor = [UIColor whiteColor];
            for (UIView *subView in searchBar.subviews) {
                if ([subView isKindOfClass:[UIView  class]]) {
                    [[subView.subviews objectAtIndex:0] removeFromSuperview];
                }
            }
            searchBar.userInteractionEnabled = NO;
            [cell.contentView addSubview:searchBar];
        }
            break;
        case 1: {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if(indexPath.row == 0) {
                cell.textLabel.text = @"Your repositories";
            } else {
                cell.textLabel.text = @"Your stars";
            }
        }
            break;
        case 2: {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if(indexPath.row == 0) {
                cell.textLabel.text = @"Followers";
            } else {
                cell.textLabel.text = @"Following";
            }
        }
            break;
        case 3: {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"History";
        }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0: {
            // search
            [self showSearchInputView];
        }
            break;
        case 1: {
            if(indexPath.row == 0) {
                // Your repositories
                
            } else {
                // Your stars
            }
        }
            break;
        case 2: {
            if(indexPath.row == 0) {
                // Followers
            } else {
                // Following
            }
        }
            break;
        case 3: {
            // History
        }
            break;
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark search bar click
- (void)showSearchInputView {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    // 创建控制器
    TCVGitHubRepositoriesController *searchController = [[TCVGitHubRepositoriesController alloc] initWithParentController:self];
    searchController.delegate = self;
    
    // 添加view
    [searchController.view setFrame:self.view.bounds];
    self.wholeView = searchController.view;
    [self.view addSubview:searchController.view];
    
    [searchController.searchBar becomeFirstResponder];
}

#pragma mark TCVGitHubRepositoriesControllerDelegate

- (void)willDismissSearchController:(TCVGitHubRepositoriesController *)searchController {
    [self.wholeView removeFromSuperview];
    self.wholeView = nil;
}

- (void)didDismissSearchController:(TCVGitHubRepositoriesController *)searchController {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)begainToOnSearchController:(TCVGitHubRepositoriesController *)searchController {
    
}

@end
