//
//  SeeMessageViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "SeeMessageViewController.h"

@interface SeeMessageViewController ()

@end

@implementation SeeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingGroup *group = [[SettingGroup alloc] init];
    group.footerTitle = @"这个页面还啥都没有。。。。";
    [self.cellData addObject:group];
    
}

@end
