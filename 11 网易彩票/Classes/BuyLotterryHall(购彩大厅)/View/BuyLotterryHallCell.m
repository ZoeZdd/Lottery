//
//  BuyLotterryHallCell.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 2016/10/26.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "BuyLotterryHallCell.h"
#import "BuyLotterryHall.h"

@interface BuyLotterryHallCell ()
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *descLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@end
@implementation BuyLotterryHallCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconView = [[UIImageView alloc] init];
        CGFloat iconViewX = 10;
        CGFloat iconViewY = 10;
        CGFloat iconViewW = 80;
        CGFloat iconViewH = 80;
        iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
        self.iconView = iconView;
        self.iconView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:iconView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(CGRectGetMaxX(iconView.frame) + 10, iconViewY, 400, 30);
        self.titleLabel = titleLabel;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
//        titleLabel.textColor = [UIColor darkGrayColor];
//        self.titleLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:titleLabel];
        
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.frame = CGRectMake(titleLabel.frame.origin.x, CGRectGetMaxY(titleLabel.frame), 400, 20);
        self.descLabel = descLabel;
        descLabel.textColor = [UIColor darkGrayColor];
        descLabel.font = [UIFont systemFontOfSize:17];
        self.descLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:descLabel];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.frame = CGRectMake(titleLabel.frame.origin.x, CGRectGetMaxY(descLabel.frame), 400, 20);
        self.timeLabel = timeLabel;
        self.timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.textColor = [UIColor darkGrayColor];
        timeLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:timeLabel];
        self.contentView.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(void)setBuyLotterryHallData:(BuyLotterryHall *)buyLotterryHallData
{
    _buyLotterryHallData = buyLotterryHallData;
    
    [self.iconView setImage:[UIImage imageNamed:buyLotterryHallData.icon]];
    self.titleLabel.text = buyLotterryHallData.title;
    self.descLabel.text = buyLotterryHallData.desc;
    self.timeLabel.text = buyLotterryHallData.time;
}
@end
