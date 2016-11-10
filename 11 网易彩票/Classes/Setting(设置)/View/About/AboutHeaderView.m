//
//  AboutHeaderView.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "AboutHeaderView.h"

@implementation AboutHeaderView

+(instancetype)aboutHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AboutHeaderView" owner:nil options:nil] lastObject];
}
@end
