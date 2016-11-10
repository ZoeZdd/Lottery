//
//  SettingItem.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/20.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义一个block，无返回值，也无参数
typedef void (^OperationBlock)();

@interface SettingItem : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subTitle; //cell.detailTextLabel

/**
 *  控制器的类型
 */
@property (nonatomic,assign) Class vcClass;

/**
 *  存储一个特殊的block 操作
 */
@property (nonatomic,copy) OperationBlock operation;


-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass;
@end
