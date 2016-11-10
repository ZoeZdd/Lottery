//
//  HtmlPage.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "HtmlPage.h"

@implementation HtmlPage

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}

+ (instancetype)htmlPageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
