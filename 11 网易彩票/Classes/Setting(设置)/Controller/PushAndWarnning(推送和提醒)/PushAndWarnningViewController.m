//
//  SettingViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "PushAndWarnningViewController.h"
#import "MBProgressHUD+Extend.h"
#import "AwardNumPushViewController.h"
#import "AwardAnimationViewController.h"
#import "ScoreLiveWarnningViewController.h"
#import "BuyTimedNoticeViewController.h"

@implementation PushAndWarnningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数据
    // 第一组
    SettingItem *item1 = [SettingArrowItem itemWithIcon:nil title:@"开奖号码推送" vcClass:[AwardNumPushViewController class]];
    SettingItem *item2 = [SettingArrowItem itemWithIcon:nil title:@"中奖动画" vcClass:[AwardAnimationViewController class]];
    SettingItem *item3 = [SettingArrowItem itemWithIcon:nil title:@"比分直播提醒" vcClass:[ScoreLiveWarnningViewController class]];
    SettingItem *item4 = [SettingArrowItem itemWithIcon:nil title:@"购彩定时提醒" vcClass:[BuyTimedNoticeViewController class]];
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1,item2,item3,item4];
    
    [self.cellData addObject:group1];
    
}



@end
