//
//  SettingItem.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/6/20.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem
-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title
{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
    }
    return self;
}

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    return [[self alloc] initWithIcon:icon title:title];
}

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass
{
    SettingItem *item = [self itemWithIcon:icon title:title];
    item.vcClass = vcClass;
    return item;
}
@end
