//
//  AboutViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutHeaderView.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingItem *item1 = [SettingArrowItem itemWithIcon:nil title:@"评分支持"];
    item1.operation = ^{
        //跳到appstore 对应的应用的界面
        /*1.评分
         》使用UIApplication打开URL 如 "itms-apps://itunes.apple.com/cn/app/%@?mt=8"
         》注意把id替换成appid //eg.725296055
         //appid 与bundleId是不同，每一个应用上传到appstore之后，就会有一个ID,这个ID是纯数字
         》什么是appID,每个应用上架后就有个application ID
         */
        // https://itunes.apple.com/cn/app/wang-yi-cai-piao-fu-cai-ti/id411654863?mt=8
//        NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/%@?mt=8",@"725296055"];
        NSString *url = @"https://itunes.apple.com/cn/app/wang-yi-cai-piao-fu-cai-ti/id411654863?mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];

    };
    SettingItem *item2= [SettingArrowItem itemWithIcon:nil title:@"客户电话" ];
    item2.subTitle = @"10086";
    item2.operation = ^{
        // 打电话
        NSURL *url = [NSURL URLWithString:@"tel://10086"];
        [[UIApplication sharedApplication] openURL:url];
    };
    SettingGroup *group = [[SettingGroup alloc] init];
    group.items = @[item1,item2];
    
    [self.cellData addObject:group];
    
    self.tableView.tableHeaderView = [AboutHeaderView aboutHeaderView];
}


@end
