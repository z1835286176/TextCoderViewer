//
//  TCVTabBarController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVTabBarController.h"

@interface TCVTabBarController ()

@end

@implementation TCVTabBarController

+ (void)initialize {
    // 保险判断
    if(self == [TCVTabBarController class]) {
        
        // 更改该项目中使用到的tabbar
        UITabBar *tabBar = [UITabBar appearanceWhenContainedInInstancesOfClasses:@[self]];
        tabBar.barTintColor = [UIColor whiteColor];
        tabBar.backgroundColor = [UIColor whiteColor];
        
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        // 普通字体
        NSMutableDictionary *attributeNormal = [NSMutableDictionary dictionary];
        attributeNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
        [tabBarItem setTitleTextAttributes:attributeNormal forState:UIControlStateNormal];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
