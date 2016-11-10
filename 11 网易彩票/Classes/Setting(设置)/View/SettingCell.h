//
//  SettingCell.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingItem;
@interface SettingCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *   表格的数据模型
 */
@property(nonatomic,strong)SettingItem *item;
@end
