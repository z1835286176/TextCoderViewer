//
//  TCVGitHubSearchController.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCVGitHubRepositoriesController;

@protocol TCVGitHubRepositoriesControllerDelegate <NSObject>
@optional

/** 暂时没卵用 */
- (void)showSearchController:(TCVGitHubRepositoriesController *)searchController;

/** call after cancle button click and before searchController removeFromParentView */
- (void)willDismissSearchController:(TCVGitHubRepositoriesController *)searchController;

/** call after cancle button click and after searchController removeFromParentView */
- (void)didDismissSearchController:(TCVGitHubRepositoriesController *)searchController;

/** call after search button click */
- (void)begainToOnSearchController:(TCVGitHubRepositoriesController *)searchController;

@end

@interface TCVGitHubRepositoriesController : UIViewController

@property (nonatomic, weak) id<TCVGitHubRepositoriesControllerDelegate> delegate;
@property (nonatomic, strong, readonly) UISearchBar *searchBar;

/** 搜索 功能用这个方法初始化 */
- (instancetype)initWithParentController:(UIViewController *)parentController;

/** 查看自己的项目用这个方法初始化 */


@end
