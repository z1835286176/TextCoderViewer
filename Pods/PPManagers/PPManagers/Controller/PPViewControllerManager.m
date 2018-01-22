//
//  PPViewControllerManager.m
//  PPManagers
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "PPViewControllerManager.h"

#pragma mark category DIYViewController of UIViewController
@implementation UIViewController (DIYViewController)

- (void)alertControllerWithTitle:(NSString *)title
                         message:(NSString *)message
                  preferredStyle:(UIAlertControllerStyle)controllerStyle
                        YESTitle:(NSString *)yesTitle
                       YESAction:(void (^)(void))yesAction
                         NOTitle:(NSString *)noTitle
                        NoAction:(void (^)(void))noAction {
    
    [self alertControllerWithTitle:title
                           message:message
                    preferredStyle:controllerStyle
                            Title1:yesTitle
                      ActionStyle1:UIAlertActionStyleDefault
                           Action1:yesAction
                            Title2:noTitle
                      ActionStyle2:UIAlertActionStyleCancel
                           Action2:noAction];
}

- (void)alertControllerWithTitle:(NSString *)title
                         message:(NSString *)message
                  preferredStyle:(UIAlertControllerStyle)controllerStyle
                          Title1:(NSString *)title1
                    ActionStyle1:(UIAlertActionStyle)actionStyle1
                         Action1:(void (^)(void))action1
                          Title2:(NSString *)title2
                    ActionStyle2:(UIAlertActionStyle)actionStyle2
                         Action2:(void (^)(void))action2 {
    
    // 简单应用
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:controllerStyle];
    UIAlertAction *actionOne = [UIAlertAction actionWithTitle:title1
                                                        style:actionStyle1
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          action1();
                                                      }];
    UIAlertAction *actionTwo = [UIAlertAction actionWithTitle:title2
                                                        style:actionStyle2
                                                      handler:^(UIAlertAction *action) {
                                                          action2();
                                                      }];
    [alert addAction:actionOne];
    [alert addAction:actionTwo];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)alertControllerWithTitle:(NSString *)title
                         message:(NSString *)message
                  preferredStyle:(UIAlertControllerStyle)controllerStyle
                        YESTitle:(NSString *)yesTitle
                       YESAction:(void (^)(void))yesAction {
    
    [self alertControllerWithTitle:title
                           message:message
                    preferredStyle:controllerStyle
                            Title1:yesTitle
                      ActionStyle1:UIAlertActionStyleDefault
                           Action1:yesAction];
}

- (void)alertControllerWithTitle:(NSString *)title
                         message:(NSString *)message
                  preferredStyle:(UIAlertControllerStyle)controllerStyle
                          Title1:(NSString *)title1
                    ActionStyle1:(UIAlertActionStyle)actionStyle1
                         Action1:(void (^)(void))action1 {
    // 简单应用
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:controllerStyle];
    UIAlertAction *actionOne = [UIAlertAction actionWithTitle:title1
                                                        style:actionStyle1
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          action1();
                                                      }];
    [alert addAction:actionOne];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)pushViewController:(UIViewController *)viewController fromViewController:(UINavigationController *)from animated:(BOOL)animated tabbarHidden:(BOOL)tabbarHidden {
    self.tabBarController.tabBar.hidden = tabbarHidden;
    [from pushViewController:viewController animated:YES];
}

@end

@interface PPViewControllerManager ()

@end

@implementation PPViewControllerManager

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
