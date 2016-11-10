//
//  BuyLotterryHall.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "BuyLotterryHall.h"

@implementation BuyLotterryHall
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.time = dict[@"time"];
        self.desc = dict[@"dec"];
    }
    return self;
}

+ (instancetype)buyLotterryHallWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
