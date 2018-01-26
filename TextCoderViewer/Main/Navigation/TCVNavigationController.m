//
//  TCVNavigationController.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVNavigationController.h"

@interface TCVNavigationController ()

@end

@implementation TCVNavigationController

+ (void)initialize {
    if(self == [TCVNavigationController class]) {
        
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
        navBar.tintColor = SystemStyleColorInThisApp();
        navBar.barTintColor = [UIColor whiteColor];
        navBar.backgroundColor = [UIColor whiteColor];
        
        NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
        attribute[NSFontAttributeName] = UIFontWithBoldSize(16);
        [navBar setTitleTextAttributes:attribute];
        
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
