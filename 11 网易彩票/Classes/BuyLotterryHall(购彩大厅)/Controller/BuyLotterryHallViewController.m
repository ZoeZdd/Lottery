//
//  BuyLotterryHallViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/17.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "BuyLotterryHallViewController.h"
#import "BuyLotterryHall.h"
#import "BuyLotterryHallCell.h"
#import "DetaileViewController.h"

@interface BuyLotterryHallViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  存储buyLotterryHall对象
 */
@property (nonatomic,strong)NSArray *buyLotterryHallDate;
@end

@implementation BuyLotterryHallViewController

-(NSArray *)buyLotterryHallDate
{
    if (!_buyLotterryHallDate) {
        // 从BuyLotterryHallLogo.json加载数据
        // 1.获取json路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BuyLotterryHallLogo.json" ofType:nil];
        
        // 2.把json转成NSData
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        // 3.再把NSData转成数组
        //json的序列化 "就是把数据转成字典/数组"
        NSArray *buyLotterryHallDateArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 4.遍历数组里字典，转成模型
        NSMutableArray *buyLotterryHallDateM = [NSMutableArray array];
        for (NSDictionary *dict in buyLotterryHallDateArray) {
            BuyLotterryHall *buyLotterryHallDate = [BuyLotterryHall buyLotterryHallWithDict:dict];
            [buyLotterryHallDateM addObject:buyLotterryHallDate];
        }
        _buyLotterryHallDate = buyLotterryHallDateM;
        
    }
    return _buyLotterryHallDate;
}

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:236/255.0 blue:226/255.0 alpha:1];
    self.tableView.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight);

    
    SettingGroup *group = [[SettingGroup alloc] init];
    
    NSMutableArray *items = [NSMutableArray array];
    for (BuyLotterryHall *buyLotterryHallDate in self.buyLotterryHallDate) {
        SettingArrowItem *item = [SettingArrowItem itemWithIcon:buyLotterryHallDate.icon title:buyLotterryHallDate.title];
        [items addObject:item];
    }
    group.items = items;
    [self.cellData addObject:group];
    

    
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"buyLotterryHallCell";
    BuyLotterryHallCell *cell = [[BuyLotterryHallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    cell.backgroundColor = [UIColor colorWithRed:239/255.0 green:236/255.0 blue:226/255.0 alpha:1];
    // 获取模型数据
    BuyLotterryHall *buyLotterryHallDate = self.buyLotterryHallDate[indexPath.row];
    cell.buyLotterryHallData = buyLotterryHallDate;
    // 显示数据
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetaileViewController *deVc = [[DetaileViewController alloc] init];
    [self.navigationController pushViewController:deVc animated:YES];
}

@end
