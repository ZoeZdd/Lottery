//
//  HtmlPage.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HtmlPage : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *html;
@property (nonatomic,copy) NSString *ID;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)htmlPageWithDict:(NSDictionary *)dict;

@end
