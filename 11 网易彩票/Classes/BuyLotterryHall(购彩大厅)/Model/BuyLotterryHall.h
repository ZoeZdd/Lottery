//
//  BuyLotterryHall.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuyLotterryHall : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *time;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)buyLotterryHallWithDict:(NSDictionary *)dict;
@end
