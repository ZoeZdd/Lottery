//
//  AwardNumPushViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "AwardNumPushViewController.h"

@interface AwardNumPushViewController ()

@end

@implementation AwardNumPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置数据
    // 初始化数据
    SettingItem *item1 = [SettingSwitchItem itemWithIcon:nil title:@"双色球"];
    SettingItem *item2 = [SettingSwitchItem itemWithIcon:nil title:@"大乐透"];
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1,item2];
    group1.headerTitle = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    [self.cellData addObject:group1];
    
}



@end
