//
//  LuckyNumberViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "LuckyNumberViewController.h"
#import "Wheel.h"
#import "ThreeButton.h"

@interface LuckyNumberViewController ()
@property(nonatomic,weak) Wheel *wheel;
@property(nonatomic,weak) ThreeButton *threeBtn;

@end

@implementation LuckyNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addBg];
    [self addWheel];
    [self addThreeButton];
    
    
}

#pragma mark - 设置背景
- (void)addBg
{
    UIImageView *bgImageView = [[UIImageView alloc] init];
    CGRect bgFrame = CGRectMake(0, 0, 0, 0);
    if (iOS7) {
        bgFrame.origin.y += 64;
    }
    bgImageView.image = [UIImage imageNamed:@"LuckyBackground.jpg"];
    bgFrame.size = self.view.frame.size;
    //bgImageView.image.size;
    bgFrame.size.height = bgFrame.size.height - 60;
    bgImageView.frame = bgFrame;
    [self.view addSubview:bgImageView];
    
}

#pragma mark - 添加转盘
- (void)addWheel
{
    Wheel *wheel = [Wheel wheel];
    wheel.center = self.view.center;
    //CGPointMake(self.view.frame.size.width * 0.5, wheel.frame.size.height * 0.5 + CGRectGetMaxY(self.threeBtn.frame) - 5);
    [self.view addSubview:wheel];
    self.wheel = wheel;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.wheel startRotating];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.wheel stopRotating];
}

#pragma mark 添加三个按钮
- (void)addThreeButton
{
    ThreeButton *tb = [ThreeButton threeButton];
    CGFloat tbCenterX = self.view.frame.size.width * 0.5;
    CGFloat tbCenterY = tb.frame.size.height * 0.5 + 10 + 64;
    if (!iOS7) {
        tbCenterY = tb.frame.size.height * 0.5 + 10;
    }
    
    tb.center = CGPointMake(tbCenterX, tbCenterY);
    [self.view addSubview:tb];
    self.threeBtn = tb;
}

@end


















