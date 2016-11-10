//
//  UIImage+Zoe.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "UIImage+Zoe.h"

@implementation UIImage (Zoe)

+(UIImage *)resizeImage:(NSString *)name{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat top = normal.size.height * 0.5;
    CGFloat left = normal.size.width * 0.5;
    UIEdgeInsets inserts = UIEdgeInsetsMake(top, left, top, left);
    return [normal resizableImageWithCapInsets:inserts];
}

+(UIImage *)resizeImageUseIOS2:(NSString *)name{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat top = normal.size.height * 0.5;
    CGFloat left = normal.size.width * 0.5;
    return [normal stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

@end
