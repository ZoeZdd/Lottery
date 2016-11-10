//
//  TabBarController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/15.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "TabBarController.h"
#import "TabBar.h"

@interface TabBarController ()<TabBarDelegate>

@end
@implementation TabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    TabBar *mTabbar = [[TabBar alloc] initWithFrame:self.tabBar.bounds];
    mTabbar.backgroundColor = [UIColor redColor];
    
    // 自定义的tabbar添加5个按钮
    for (NSInteger i = 0;i < 5;i++){
        //获取普通按钮的图片名称
        NSString *normalImg = [NSString stringWithFormat:@"TabBar%ld",i+1];
        // 获取选中按钮图片名称
        NSString *selectedImg = [NSString stringWithFormat:@"TabBar%ldSel",i+1];
        [mTabbar addTabbarBtnWithNormalImage:normalImg selectedImage:selectedImg];
    }

    
    // 设置代理
    mTabbar.delegate = self;
    
    [self.tabBar addSubview:mTabbar];
}

-(void)tabbar:(TabBar *)tabbar didSelectedFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}
@end
