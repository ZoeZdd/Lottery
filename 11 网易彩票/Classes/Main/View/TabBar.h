//
//  TabBar.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/15.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <NSObject>

-(void)tabbar:(TabBar *)tabbar didSelectedFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface TabBar : UIView

@property (nonatomic,weak) id<TabBarDelegate> delegate;

/**
 * 传普通状态图片和选中状态图片，内部帮你添加一个按钮
 */
-(void)addTabbarBtnWithNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;

@end

// 自定义按钮
@interface TabBarButton : UIButton

@end














