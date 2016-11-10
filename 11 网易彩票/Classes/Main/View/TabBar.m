//
//  TabBar.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/15.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()

/**
 *  当前选中的按钮
 */
@property (nonatomic,weak) UIButton *selectedBtn;

@end

@implementation TabBar

/*
     *自定义控件
     1.在initWithFrame初始化的方法，添加子控件
     2.layoutSubviews 布局子控件frame
 */

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        // 初始化按钮
//        [self setupBtns];
    }
    return self;
}

#pragma mark - 初始化按钮
//-(void)setupBtns{   
//}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    // 布局子控件
    // 按钮宽度和高度
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;
    
    // 为添加的5个按钮设置frame
//    for (NSInteger i = 0; i < count; i++){
//        UIButton *btn = self.subviews[i];
//        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
//    }
    
    for (UIButton *btn in self.subviews) {
        btn.frame = CGRectMake(btnW * btn.tag, 0, btnW, btnH);
    }
}

-(void)btnClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedFrom:to:)]) {
        [self.delegate tabbar:self didSelectedFrom:self.selectedBtn.tag to:btn.tag];
    }
    
    // 取消之前选中
    self.selectedBtn.selected = NO;
    
    //设置当前选中
    btn.selected = YES;
    self.selectedBtn = btn;
    
}

#pragma mark - 初始化按钮
-(void)addTabbarBtnWithNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    UIButton *btn = [TabBarButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    // 监听事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 绑定tag
    btn.tag = self.subviews.count;
    [self addSubview:btn];
    
    //默认选中第一个按钮
    if (btn.tag == 0){
//        btn.selected = YES;
//        self.selectedBtn = btn;
        [self btnClick:btn];
    }

}


@end

@implementation TabBarButton

-(void)setHighlighted:(BOOL)highlighted
{
    // 只要不调用父类方法，按钮就不会有高亮效果
//    [super setHighlighted:highlighted];
}

@end





























