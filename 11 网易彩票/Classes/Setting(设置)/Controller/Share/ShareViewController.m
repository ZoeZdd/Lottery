//
//  ShareViewController.m
//  11 网易彩票
//
//  Created by 庄丹丹 on 16/10/25.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "ShareViewController.h"
#import <MessageUI/MessageUI.h>

@interface ShareViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    //初始化数据
    //第一组
    SettingItem *item1 = [SettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    SettingItem *item2= [SettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享" ];
    // 弱引用
    __weak typeof(self) selfVC = self;
    // block 循环引用
    item2.operation = ^{
        //发短信 不能设置短信内容
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://10086"]];
        //判断能否发送短信
        if (![MFMessageComposeViewController canSendText]) {
            return;
        }
        //如果要设置内容，使用MessageUI
        //1.创建MFMessageComposeViewController
        MFMessageComposeViewController *msgVC = [[MFMessageComposeViewController alloc] init];
        //设置电话
        msgVC.recipients = @[@"10086",@"10010"];
        //设置内容
        msgVC.body = @"恭喜你中奖，请汇款.....";
        //设置代理
        msgVC.messageComposeDelegate = selfVC;
        //显示信息界面
        [selfVC presentViewController:msgVC animated:YES completion:nil];

    };
    SettingItem *item3 = [SettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];             
    item3.operation = ^{
        //邮件分享 不能设置内容
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://123213412@qq.com"]];
      
        if (![MFMailComposeViewController canSendMail])
            {
                return ;
            }
        //1.创建MFMailComposeViewController
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        //设置接收邮件人
        [mailVC setToRecipients:@[@"5201314@qq.com",@"zoezdd@qq.com"]];
        
        //抄送
        [mailVC setCcRecipients:@[@"5201314@qq.com",@"zoezdd@qq.com"]];
        
        //密送
        [mailVC setBccRecipients:@[@"5201314@qq.com",@"zoezdd@qq.com"]];
        
        //设置内容
        [mailVC setMessageBody:@"恭喜你中奖 ...." isHTML:NO];
        //设置代理
        mailVC.mailComposeDelegate = selfVC;
        //显示信息界面
        [selfVC presentViewController:mailVC animated:YES completion:nil];
    
        
        
        
    };
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[item1,item2,item3];
    
    [self.cellData addObject:group1];

}

#pragma mark - 信息的代理方法
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    if (result == MessageComposeResultSent || result == MessageComposeResultCancelled) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - 邮件的代理方法
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
