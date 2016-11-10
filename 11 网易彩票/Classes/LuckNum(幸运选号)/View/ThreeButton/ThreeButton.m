//
//  ThreeButton.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "ThreeButton.h"

@implementation ThreeButton

+ (instancetype)threeButton
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ThreeButton" owner:nil options:nil]lastObject];
}


@end
