//
//  SettingViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "BaseSettingViewController.h"
#import "SettingCell.h"
#import "MBProgressHUD+Extend.h"




@implementation BaseSettingViewController

#pragma mark - 只要一调用 init 方法，就返回组样式表格
-(instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}
-(NSMutableArray *)cellData
{
    if (!_cellData) {
        _cellData = [NSMutableArray array];
    }
    return _cellData;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}

#pragma mark - Table view data source

#pragma mark - 组的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellData.count;
}
#pragma mark - 组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 组数据
    SettingGroup *group = self.cellData[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingCell *cell = [SettingCell cellWithTableView:tableView];
    // 获取模型数据
    SettingGroup *group = self.cellData[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    // 显示数据
    cell.item = item;
    return cell;
    
}

#pragma mark - cell的点中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 进入下一个控制器
    // 获取模型里的vcClass【控制器的类型】
    SettingGroup *group = self.cellData[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    // 判断是否有“特殊的操作”
    if (item.operation) {
        item.operation();
    }else if (item.vcClass) {
        // 创建控制器 再显示
        id vc = [[item.vcClass alloc] init];
        [vc setTitle:item.title];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - 头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 获取数据模型
    SettingGroup *group = self.cellData[section];
    return group.headerTitle;
}

#pragma mark - 尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 获取数据模型
    SettingGroup *group = self.cellData[section];
    return group.footerTitle;

}
@end
