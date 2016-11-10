//
//  Product.h
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,copy)NSString *schemes;
@property(nonatomic,copy)NSString *appUrl;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)productWithDict:(NSDictionary *)dict;

@end
