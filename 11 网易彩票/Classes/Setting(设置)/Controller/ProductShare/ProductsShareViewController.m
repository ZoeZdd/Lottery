//
//  ProductsShareViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "ProductsShareViewController.h"
#import "Product.h"
#import "ProductCell.h"

@interface ProductsShareViewController ()
/**
 *  所有的产品，里面放Product
 */
@property (nonatomic,strong) NSArray *products;
@end

@implementation ProductsShareViewController
-(NSArray *)products
{
    if (!_products) {
        //1.获取json路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        
        //2.把json转成NSData
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        //3.再把NSData转成数组
        
        //json的序列化 "就是把数据转成字典/数组"
        NSArray *productArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",obj);
        
        //4.遍历数组里字典，转成模型
        NSMutableArray *productsM =[NSMutableArray array];
        for (NSDictionary *dict in productArray) {
            Product *product = [Product productWithDict:dict];
            [productsM addObject:product];
        }
        
        _products = productsM;
        
    }
    
    return _products;

}

// 重用的ID
static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init
{
    // UICollectionViewController初始化的时候，需要一个 "布局参数"
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    if (self = [super initWithCollectionViewLayout:flowlayout])
    {
        //最终的cell的大小，是由 流水布局 决定，由xib是决定不了
        //设置cell的尺寸
        flowlayout.itemSize = CGSizeMake(80, 100);
        //设置cell的行的间距
        flowlayout.minimumLineSpacing = 50;
        //设置cell的列间距
        flowlayout.minimumInteritemSpacing = 20;
        //设置section的四边距
        flowlayout.sectionInset = UIEdgeInsetsMake(20, 10, 0,10);
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景
    self.collectionView.backgroundColor = [UIColor whiteColor];

    // Register cell classes
    //注册一个可循环引用的cell
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //设置模型
    cell.product = self.products[indexPath.row];
    
    return cell;
}

#pragma mark cell的选中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%@",indexPath);
    Product *product = self.products[indexPath.row];
    UIApplication *app = [UIApplication sharedApplication];
    
    NSString *urlStr = nil;
    if (product.schemes.length != 0) {
        urlStr = [NSString stringWithFormat:@"%@://%@",product.schemes,product.identifier];
    } else {
        urlStr = product.identifier;
    }
    
    if ([app canOpenURL:[NSURL URLWithString:urlStr]]) {
        [app openURL:[NSURL URLWithString:urlStr]];
    } else {
        [app openURL:[NSURL URLWithString:product.appUrl]];
    }
    
    
}

@end




























