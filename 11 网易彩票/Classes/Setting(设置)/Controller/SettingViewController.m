//
//  SettingViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "SettingViewController.h"
#import "PushAndWarnningViewController.h"
#import "MBProgressHUD+Extend.h"
#import "HelpViewController.h"
#import "ProductsShareViewController.h"
#import "ShareViewController.h"
#import "AboutViewController.h"
#import "SeeMessageViewController.h"


@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    // 初始化数据
      // 第一组
    SettingItem *item1 = [SettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" vcClass:[PushAndWarnningViewController class]];
    SettingItem *item2 = [SettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    SettingItem *item3 = [SettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音和效果"];
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1,item2,item3];
    [self.cellData addObject:group1];
    
    
    //第二组
    SettingItem *item4 = [SettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查版本更新"];
    item4.operation = ^{
        /*
         判断是否有最新的版本
         if(serverVersion > localVersion){
         //跳到APPStore （URL:地址）
         }else{
         最新版本
         
         }
         */
        
        // 1.获取服务器的版本号
        
        // 2.获取本地版本号【从bundle里获取】
//        NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
//        NSString *localVersion = info[@"CFBundleShortVersionString"];
        // 3.对比
        
        //现在，给一个假象
        [MBProgressHUD showMessage:@"正在检查最新版本"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"当前已经是最新版本"];
        });
        
    };
    
    SettingItem *item5 = [SettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" vcClass:[HelpViewController class]];
    
    SettingItem *item6 = [SettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" vcClass:[ShareViewController class]];
    
    SettingItem *item7 = [SettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" vcClass:[SeeMessageViewController class]];
    
    SettingItem *item8 = [SettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" vcClass:[ProductsShareViewController class]];
    
    SettingItem *item9 = [SettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" vcClass:[AboutViewController class]];
    SettingGroup *group2 = [[SettingGroup alloc] init];
    group2.items = @[item4,item5,item6,item7,item8,item9];
    [self.cellData addObject:group2];

    // 显示数据
    
}


@end
