//
//  SettingGroup.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/24.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject

/**
 *  组的头部标题
 */
@property(nonatomic,copy)NSString *headerTitle;

/**
 *  组的尾部标题
 */
@property(nonatomic,copy)NSString *footerTitle;
/**
 *  组的每一行数据模型
 */
@property(nonatomic,strong)NSArray *items;
@end
