//
//  bundlingViewController.m
//  现金提现
//
//  Created by apple on 15/10/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "bundlingViewController.h"
#define chooseColor [UIColor colorWithRed:0.44 green:0.81 blue:0.76 alpha:1]

@interface bundlingViewController ()<UIActionSheetDelegate>
@property(nonatomic,strong)UITextField * AliAccount;
@property(nonatomic,strong)UITextField * AliPassword;
@property(nonatomic,strong)UIButton    * AliSure;
@end

@implementation bundlingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定支付宝";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.AliAccount = [[UITextField alloc]initWithFrame:CGRectMake(16, 96, 382, 40)];
    self.AliAccount.text = @"请输入支付宝账号";
    self.AliAccount.backgroundColor = [UIColor whiteColor];
    [self.AliAccount addTarget:self action:@selector(clearAliAccount) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.AliAccount];
    self.AliPassword= [[UITextField alloc]initWithFrame:CGRectMake(16, 152, 382, 40)];
    self.AliPassword.text= @"请输入支付宝密码";
    self.AliPassword.backgroundColor = [UIColor whiteColor];
    [self.AliPassword addTarget:self action:@selector(clearAliPassword) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.AliPassword];
    self.AliSure    = [[UIButton alloc]initWithFrame:CGRectMake(16, 485, 382, 35)];
    self.AliSure.backgroundColor = chooseColor;
    [self.AliSure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.AliSure setTitle:@"确定" forState:UIControlStateNormal];
    [self.AliSure addTarget:self action:@selector(baocun) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.AliSure];

}
-(void)clearAliAccount{
self.AliAccount.text = @"";
}
-(void)clearAliPassword{
self.AliPassword.text = @"";
}
-(void)baocun{

    if ([self.AliPassword.text isEqual:@""]||[self.AliAccount.text  isEqual:@""]||    [self.AliAccount.text isEqualToString: @"请输入支付宝账号"]||    [self.AliPassword.text  isEqualToString:@"请输入支付宝密码"]
) {
        NSLog(@"输入有误");
        UIAlertView * Warning = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请检查，填写内容不能为空!"     delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [Warning show];
    }else{
//        NSMutableArray * array = [[NSMutableArray alloc]init];
        NSMutableDictionary *dictionary1 = [[NSMutableDictionary alloc] init];
        [dictionary1 setValue:self.AliAccount.text forKey:@"AliAccount"];
        [dictionary1 setValue:self.AliPassword.text forKey:@"AliPassword"];
        [dictionary1 setValue:@"10000" forKey:@"AliMoney"];
        NSLog(@"%@",dictionary1);
        
        NSString * sandboxPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        NSLog(@"%@",sandboxPath);
        NSString *fileName = [sandboxPath stringByAppendingPathComponent:@"AliAccountCode.plist"];
        
        //        NSFileManager *fm = [NSFileManager defaultManager];
        //        if ([fm createFileAtPath:fileName contents:nil attributes:nil] ==YES) {
        //            NSLog(@"%@",fileName);
        [dictionary1 writeToFile:fileName atomically:YES];
        /*
         要用地址数据就从 fileName 去拿出来
         */
        NSLog(@"文件写入完成");
        NSDictionary *dict2  =  [NSDictionary dictionaryWithContentsOfFile:fileName];
        NSString*text=[dict2 objectForKey:@"AliAccount"];
        NSLog(@"%@",text);

        [self.navigationController popViewControllerAnimated:YES];
    }
    
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
