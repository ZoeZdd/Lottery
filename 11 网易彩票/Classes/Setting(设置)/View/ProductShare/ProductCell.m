//
//  ProductCell.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "ProductCell.h"
#import "Product.h"

@interface ProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation ProductCell

-(void)awakeFromNib
{
    [super awakeFromNib];
    // 这个方法之后，连线才完成
    // 剪切圆角
    self.imgView.layer.cornerRadius = 15;
    self.imgView.layer.masksToBounds = YES;
}
-(void)setProduct:(Product *)product
{
    _product = product;
    // 设置图片
    self.imgView.image = [UIImage imageNamed:product.icon];
    // 设置产品的名称
    self.nameLabel.text = product.title;
}
@end
