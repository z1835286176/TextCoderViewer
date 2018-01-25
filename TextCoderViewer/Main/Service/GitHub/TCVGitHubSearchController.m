//
//  TCVGitHubSearchController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubSearchController.h"

@interface TCVGitHubSearchController () <UISearchBarDelegate>

@end

@implementation TCVGitHubSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self setUpTopView];
}

- (void)setUpTopView {
    
    UIColor *backColor = [UIColor colorWithWholeRed:249 green:249 blue:249];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    [backView setBackgroundColor:backColor];
    [self.view addSubview:backView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 23, self.view.frame.size.width, 40)];//
    searchBar.placeholder = @"搜索 GitHub";
    searchBar.showsCancelButton = YES;
    searchBar.barTintColor = backColor;
    searchBar.delegate = self;
    for (UIView *subView in searchBar.subviews) {
        if ([subView isKindOfClass:[UIView  class]]) {
            [[subView.subviews objectAtIndex:0] removeFromSuperview];
        }
    }
    [backView addSubview:searchBar];
    
    UIButton *cancleBtn = [searchBar valueForKey:@"_cancelButton"];
    [cancleBtn setTintColor:[UIColor colorWithWholeRed:49 green:126 blue:244]];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    [searchBar becomeFirstResponder];
}

#pragma mark UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

@end
