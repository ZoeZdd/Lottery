//
//  BuyTogetherViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/19.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "BuyTogetherViewController.h"

@implementation BuyTogetherViewController
- (IBAction)btnClick:(UIButton *)btn {
    // 实现按钮图片的旋转
    [UIView animateWithDuration:0.25 animations:^{
        if (CGAffineTransformIsIdentity(btn.imageView.transform)) {
            // 要旋转
            btn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }else{
            btn.imageView.transform = CGAffineTransformIdentity;
        }
    }];
    
}

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:236/255.0 blue:226/255.0 alpha:1];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DefaultFooter"]];
     imageView.frame = CGRectMake(7, 260, 400, 200);
    [self.view addSubview:imageView];
    
}
@end
