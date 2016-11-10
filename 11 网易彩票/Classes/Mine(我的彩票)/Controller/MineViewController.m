//
//  MineViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "MineViewController.h"
#import "SettingViewController.h"
#import "UIImage+Zoe.h"

@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)settingBtnClick:(id)sender;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置按钮图片
    [self.loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButton"] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    self.loginBtn.center = self.view.center;
        
}

- (IBAction)settingBtnClick:(id)sender {
    // 进入 设置 页面
    SettingViewController *settingVc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES];
}
@end
