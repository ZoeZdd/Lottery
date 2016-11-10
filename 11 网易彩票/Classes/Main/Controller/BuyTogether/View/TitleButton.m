//
//  TitleButton.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/19.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "TitleButton.h"

#define ImageW 30 // 图片的宽度

@implementation TitleButton

// 设置图片显示的样式
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}
//设置标题位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width - ImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(0, 0, titleW, titleH);
}

// 设置图片的位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = ImageW;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - ImageW;
    return CGRectMake(imageX, 0, imageW, imageH);
}

#pragma mark - 去除按钮的高亮状态
-(void)setHighlighted:(BOOL)highlighted{
    
}







@end















