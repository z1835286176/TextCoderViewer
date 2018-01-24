//
//  TCVGitHubViewController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubViewController.h"

@interface TCVGitHubViewController () <UITableViewDelegate, UITableViewDataSource>

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


@end
