
//
//  AliPayDetailedViewController.m
//  现金提现
//
//  Created by apple on 15/10/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AliPayDetailedViewController.h"
#import "bundlingViewController.h"
#define chooseColor [UIColor colorWithRed:0.44 green:0.81 blue:0.76 alpha:1]

@interface AliPayDetailedViewController ()
@property (nonatomic,strong)UILabel * Acclab;
@end

@implementation AliPayDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定信息";
    UIButton * changeAlipay = [[UIButton alloc]initWithFrame:CGRectMake(110, 504, 202, 30)];
    [changeAlipay setTitle:@"更改支付宝账户" forState:UIControlStateNormal];
    changeAlipay.backgroundColor = chooseColor;
    [changeAlipay addTarget:self action:@selector(changeAliPayAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeAlipay];
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel * AliPayAccount = [[UILabel alloc]initWithFrame:CGRectMake(43, 99, 329, 44)];
    NSString * sandboxPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSLog(@"%@",sandboxPath);
    NSString *fileName = [sandboxPath stringByAppendingPathComponent:@"AliAccountCode.plist"];
    NSDictionary *dict2  =  [NSDictionary dictionaryWithContentsOfFile:fileName];
    NSString*UserAliaccount=[dict2 objectForKey:@"AliAccount"];
    [AliPayAccount setTextColor:[UIColor blueColor]];
    NSString*text1 = [NSString stringWithFormat:@"账户:%@",UserAliaccount];
    AliPayAccount.text = text1;
    self.Acclab = AliPayAccount;
    [self.view addSubview:AliPayAccount];
    
    NSString*UserMoney=[dict2 objectForKey:@"AliMoney"];
    UILabel * MoneyLab = [[UILabel alloc]initWithFrame:CGRectMake(106, 210, 202, 141)];
    MoneyLab.text =[NSString stringWithFormat:@"余额:%@",UserMoney];
    MoneyLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:MoneyLab];

}
-(void)viewDidDisappear:(BOOL)animated{
    self.Acclab.text = @"";
}
-(void)changeAliPayAccount{

    bundlingViewController * bvc = [[bundlingViewController alloc]init];
    [self.navigationController pushViewController:bvc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
