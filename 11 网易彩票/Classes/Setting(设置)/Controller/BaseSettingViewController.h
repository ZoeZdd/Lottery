//
//  BaseSettingViewController.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingItem.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "SettingLabelItem.h"
#import "SettingGroup.h"



@interface BaseSettingViewController : UITableViewController

/**
 * 表格数据，里面存储SettingGroup
 */
@property(nonatomic,strong)NSMutableArray *cellData;

@end
