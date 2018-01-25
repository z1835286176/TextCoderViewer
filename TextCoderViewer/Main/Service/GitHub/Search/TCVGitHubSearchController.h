//
//  TCVGitHubSearchController.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCVGitHubSearchController;

@protocol TCVGitHubSearchControllerDelegate <NSObject>
@optional

/** 暂时没卵用 */
- (void)showSearchController:(TCVGitHubSearchController *)searchController;

/** call after cancle button click and before searchController removeFromParentView */
- (void)willDismissSearchController:(TCVGitHubSearchController *)searchController;

/** call after cancle button click and after searchController removeFromParentView */
- (void)didDismissSearchController:(TCVGitHubSearchController *)searchController;

/** call after search button click */
- (void)begainToOnSearchController:(TCVGitHubSearchController *)searchController;

@end

@interface TCVGitHubSearchController : UIViewController
@property (nonatomic, weak) id<TCVGitHubSearchControllerDelegate> delegate;
@property (nonatomic, strong, readonly) UISearchBar *searchBar;
- (instancetype)initWithParentController:(UIViewController *)parentController;

@end
