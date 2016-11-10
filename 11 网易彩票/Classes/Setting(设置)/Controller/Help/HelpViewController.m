//
//  HelpViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "HelpViewController.h"
#import "HtmlPage.h"
#import "WebViewController.h"

@interface HelpViewController ()

/**
 *  所有的界面信息，存储HtmlPage对象
 */
@property (nonatomic,strong)NSArray *htmls;

@end

@implementation HelpViewController

-(NSArray *)htmls
{
    if (!_htmls) {
        // 从help.json加载数据
        // 1.获取json路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        // 2.把json转成NSData
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        // 3.再把NSData转成数组
        //json的序列化 "就是把数据转成字典/数组"
        NSArray *helpArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 4.遍历数组里字典，转成模型
        NSMutableArray *htmlsM = [NSMutableArray array];
        for (NSDictionary *dict in helpArray) {
            HtmlPage *htmlPage = [HtmlPage htmlPageWithDict:dict];
            [htmlsM addObject:htmlPage];
        }
        _htmls = htmlsM;
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //把htmls的数据转成cellData显示的数据
    SettingGroup *group = [[SettingGroup alloc] init];
    
    NSMutableArray *items = [NSMutableArray array];
    for (HtmlPage *htmlPage in self.htmls) {
        SettingArrowItem *item = [SettingArrowItem itemWithIcon:nil title:htmlPage.title];
        [items addObject:item];
    }
    group.items = items;
    [self.cellData addObject:group];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //进入一个叫 “网页的控制器”
    // 1.创建一个导航控制器,设置它的子控制器为 “网页的控制器”
    WebViewController *webVc = [[WebViewController alloc] init];
    // 设置模型数据
    webVc.htmlPage = self.htmls[indexPath.row];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:webVc];
    // 2.以模态窗口的方式来打开控制器
    [self presentViewController:navc animated:YES completion:nil];
}

@end
