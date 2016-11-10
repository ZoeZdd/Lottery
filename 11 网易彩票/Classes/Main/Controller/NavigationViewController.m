//
//  NavigationViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/17.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "NavigationViewController.h"

@implementation NavigationViewController

#pragma mark - 类被第一次使用的时候调用
+(void)initialize
{
    // 设置主题
    /*
     * 1.如果是通过导航控制器获取的导航条来设置背景，它是局部
     *   self.navigationController.navigationBar
     * 2.如果想设置一次导航栏的背景，这个导航条的对象，通过导航条的一个类方法获取的就可以 [UINavigationBar appearance]
     */
    
    // 1.设置导航条背景图片 －－ 全局设置
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 2.UIApplication设置状态栏样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    // 3.设置导航条标题的字体和颜色
    NSDictionary *titleAttr = @{
                                NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:20]
                                };
    [navBar setTitleTextAttributes:titleAttr];
    
    // 设置返回按钮样式
    navBar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *navItem = [UIBarButtonItem appearance];
    // 设置item的字体大小
    [navItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    
}
#pragma mark 设置状态栏的样式
//如果有导航控制器的，状态栏的样式要在导航控制器里设置，不能在子控制器里设置
//这只方式只能针对局部的控制器
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark - 导航控制器的子控制器被pop【移除】的时候会调用
-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}
#pragma mark - 导航控制器的子控制器被push 的时候会调用
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 设置 push 新控制器的时候隐藏Tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    return [super pushViewController:viewController animated:animated];
}

@end
