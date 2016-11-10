//
//  WebViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "WebViewController.h"
#import "HtmlPage.h"

@interface WebViewController ()<UIWebViewDelegate>
//如果要在应用里显示的网页
//使用一个叫UIWebView控件，这个控制就能显示网页

@property (nonatomic,weak) UIWebView *webView;
@end

@implementation WebViewController

-(void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    self.view = webView;
    self.webView = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"网页控制器";
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    
    //显示网页数据 UIWebView
    //加载 "远程" 的网站
    //NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    //加载 "本地" 的网页信息
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.htmlPage.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //加载一个请求
    [self.webView loadRequest:request];
    //如果在调用javascript ，要设置webView的代理，设置webview一个方法
}
#pragma mark - 网页加载完成调用
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (!self.htmlPage.ID) return;
    // 执行javascript
    NSString *jsString = [NSString stringWithFormat:@"window.location.href = '#%@'",self.htmlPage.ID];
    [webView stringByEvaluatingJavaScriptFromString:jsString];
}
-(void)btnClick
{
    // 隐藏模态窗口
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end











