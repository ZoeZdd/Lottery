//
//  ScoreLiveWarnningViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "ScoreLiveWarnningViewController.h"

@interface ScoreLiveWarnningViewController ()
@property(nonatomic,weak)UITextField *textField;
@property(nonatomic,assign)BOOL startField;
@end

@implementation ScoreLiveWarnningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个textField
    UITextField *textField = [[UITextField alloc] init];
    
    //创建DatePicker
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"ZH"];
    textField.inputView = datePicker;
    
    [self.tableView addSubview:textField];
    self.textField = textField;
    
    [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    
    __weak typeof(self) selfObj = self;

    // 设置数据
    // 初始化数据
    // 第一组
    SettingItem *item1 = [SettingSwitchItem itemWithIcon:nil title:@"提醒我关注的比赛"];
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1];
    group1.footerTitle = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    [self.cellData addObject:group1];
    
    // 第二组
    SettingItem *item2 = [SettingLabelItem itemWithIcon:nil title:@"起始时间"];
    item2.operation = ^{
        selfObj.startField = YES;
        [selfObj.textField becomeFirstResponder];
    };
    SettingGroup *group2 = [[SettingGroup alloc] init];
    group2.items = @[item2];
    group2.headerTitle = @"当你有新中奖订单，启动程序时通过动画提醒您。  未避免过于频繁，高频彩不会提醒。";
    [self.cellData addObject:group2];
    
     //第三种组
    SettingItem *item3 = [SettingLabelItem itemWithIcon:nil title:@"结束时间"];
    item3.operation = ^{
        selfObj.startField = NO;
        [selfObj.textField becomeFirstResponder];
        
        
        [UIView beginAnimations:nil context:nil];
        selfObj.tableView.contentOffset = CGPointMake(0, 60);
        [UIView commitAnimations];

    };
    SettingGroup *group3 = [[SettingGroup alloc] init];
    group3.items = @[item3];
    [self.cellData addObject:group3];
}

-(void)valueChange:(UIDatePicker *)datePicker{
    
    NSDate *date = datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    
    
    if (self.startField) {
        NSLog(@"====== %@",[formatter stringFromDate:date]);
    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}


@end
