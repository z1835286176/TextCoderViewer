//
//  AppDelegate.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/10.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:PPWindowBounds];
    
    [self showMainController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showMainController {
    // 文档
    TCVDocumentViewController *documentVC = [[TCVDocumentViewController alloc] init];
    documentVC.title = @"文档";
    TCVNavigationController *docuNav = [[TCVNavigationController alloc] initWithRootViewController:documentVC];
    docuNav.tabBarItem.image = [UIImage imageNamed:@"file_box"];
    
    // 服务
    TCVServiceViewController *serviceVC = [[TCVServiceViewController alloc] init];
    serviceVC.title = @"服务";
    TCVNavigationController *serviceNav = [[TCVNavigationController alloc] initWithRootViewController:serviceVC];
    serviceNav.tabBarItem.image = [UIImage imageNamed:@"cloud"];
    
    // 设置
    TCVSettingViewController *settingVC = [[TCVSettingViewController alloc] init];
    settingVC.title = @"设置";
    TCVNavigationController *settingNav = [[TCVNavigationController alloc] initWithRootViewController:settingVC];
    settingNav.tabBarItem.image = [UIImage imageNamed:@"setting"];
    
    TCVTabbarController *tabbarCon = [[TCVTabbarController alloc] init];
    tabbarCon.viewControllers = @[docuNav, serviceNav, settingNav];
    
    self.window.rootViewController = tabbarCon;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
