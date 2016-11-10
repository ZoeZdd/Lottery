
//
//  Product.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.identifier = dict[@"id"];
        self.schemes = dict[@"customUrl"];
        self.appUrl = dict[@"url"];
    }
    
    return self;
}
+(instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
