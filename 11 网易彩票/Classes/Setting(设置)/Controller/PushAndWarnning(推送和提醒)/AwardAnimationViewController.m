//
//  AwardAnimationViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "AwardAnimationViewController.h"

@interface AwardAnimationViewController ()

@end

@implementation AwardAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置数据
    // 初始化数据
    SettingItem *item1 = [SettingSwitchItem itemWithIcon:nil title:@"中奖动画"];
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1];
    group1.headerTitle = @"当你有新中奖订单，启动程序时通过动画提醒您。  未避免过于频繁，高频彩不会提醒。";
    [self.cellData addObject:group1];

}


@end
