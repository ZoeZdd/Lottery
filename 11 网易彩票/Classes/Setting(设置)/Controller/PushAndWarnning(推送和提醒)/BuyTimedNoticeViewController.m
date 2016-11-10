//
//  CZBuyTimedNoticeViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "BuyTimedNoticeViewController.h"

@interface BuyTimedNoticeViewController ()

@end

@implementation BuyTimedNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置数据
    // 初始化数据
    SettingItem *item1 = [SettingSwitchItem itemWithIcon:nil title:@"打开提醒"];
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1];
    group1.headerTitle = @"你可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [self.cellData addObject:group1];

}


@end
