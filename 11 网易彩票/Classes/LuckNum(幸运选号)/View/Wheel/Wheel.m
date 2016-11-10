//
//  Wheel.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "Wheel.h"
#import "WheelButton.h"

@interface Wheel ()

@property (weak, nonatomic) IBOutlet UIImageView *wheelImageView;
// 选中的按钮
@property(nonatomic,weak)UIButton *selectedBtn;
// 定时器
@property(nonatomic,strong)CADisplayLink *link;


@end
@implementation Wheel
+(instancetype)wheel
{
    return [[[NSBundle mainBundle] loadNibNamed:@"Wheel" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    //添加12按钮
    NSInteger btnCount = 12;
    //加载大图片
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *bigSelImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat scale = [UIScreen mainScreen].scale - 0.98;
    CGFloat astrologyImageH = bigImage.size.height * scale;
    CGFloat astrologyImageW =   bigImage.size.width / btnCount * scale;
       
    CGFloat angle = M_PI / 6;
//    CGFloat angle = M_PI_2 / 2.2;
   
    for (int i = 0; i < btnCount; i++) {
        WheelButton *btn = [WheelButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, 80, 180);
        
        // 设置背景
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.tag = i;
        
        //设置Normal image 对应图片的区域
        CGRect smallRect = CGRectMake(astrologyImageW * i, 0, astrologyImageW, astrologyImageH);
        CGImageRef smallImageRef = CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImageRef] forState:UIControlStateNormal];
        
        //设置Selected image
        CGImageRef smallSelImageRef = CGImageCreateWithImageInRect(bigSelImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallSelImageRef] forState:UIControlStateSelected];
    
        
        // 设置锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
//        btn.layer.position = self.wheelImageView.center;
        btn.center = self.wheelImageView.center;

//        btn.backgroundColor = [UIColor redColor];
        //旋转
        btn.transform = CGAffineTransformMakeRotation(angle * i);
        
        // 监听事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        //默认第一个按钮选中
        if (i == 0) {
            [self btnClick:btn];
        }
        [self.wheelImageView addSubview:btn];
    }
}
-(void)btnClick:(UIButton *)btn
{
    // 去除之前的选中按钮
    self.selectedBtn.selected = NO;
    
    // 设置当前选中按钮
    btn.selected = YES;
    self.selectedBtn = btn;
}

/**
 *  开始不停的旋转
 */
-(void)startRotating
{
    //如果当前有定时器，就不要添加了
    if (self.link) {
        return;
    }
    //开始一个定时器
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

#pragma mark 实现旋转
-(void)update{
    CGFloat angle = M_PI_4 / 60;
    self.wheelImageView.transform = CGAffineTransformRotate(self.wheelImageView.transform, angle);
}
/**
 *  停止的旋转
 */
-(void)stopRotating
{
    // 禁用定时器
    [self.link invalidate];
    self.link = nil;
}
- (IBAction)centerBtnClick:(id)sender {
    
    //去除以前的自动旋转
    [self stopRotating];
    
    //开始选号
    
    //快速旋转 ,其它按钮不给点
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI * 6);
    rotationAni.duration = 3;
    
    //设置代理
    rotationAni.delegate = self;
    
    [self.wheelImageView.layer addAnimation:rotationAni forKey:nil];
    
    
    
    
}

#pragma mark 核心动画的代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self.link) {
            [self startRotating];
        }
    });
}
@end














