
//
//  ViewController.m
//  地址管理
//
//  Created by apple on 15/10/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TSLocateView.h"
#define COLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()<UIActionSheetDelegate,UIAlertViewDelegate>
@property (nonatomic,strong)UITextField * AdressName;
@property (nonatomic,strong)UITextField * AdressTelephone;
@property (nonatomic,strong)UITextField * AdreessCity;
@property (nonatomic,strong)UITextField * AdreessInputLocation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * sandboxPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSLog(@"%@",sandboxPath);
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel * AdressTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 150, 33)];
    AdressTitle.text = @"收货地址";
    AdressTitle.textColor= [UIColor lightGrayColor];
    [self.view addSubview:AdressTitle];
    
    UILabel * AdressTip = [[UILabel alloc]initWithFrame:CGRectMake(0, 352, 414, 60)];
    AdressTip.numberOfLines = 0;
    
    AdressTip.textColor = [UIColor lightGrayColor];
    AdressTip.font = [UIFont systemFontOfSize:17];
    AdressTip.text = @"＊免费抢是实物活动，奖品将快递到指定地址，请务必填写正确的地址，收获地址";
    AdressTip.tintColor = [UIColor lightGrayColor];
    [self.view addSubview:AdressTip];
    
    UIButton * saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 444, 404, 40)];
    [saveBtn setTitle:@"保存地址" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveadress) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveBtn.backgroundColor = [UIColor greenColor];//ps吸一下 改下颜色用COLOR(rgbValue)
    [self.view addSubview:saveBtn];
    
    UIView * inputAdressView = [[UIView alloc]initWithFrame:CGRectMake(0, 87, 414, 250)];
    inputAdressView.backgroundColor = [UIColor whiteColor];
    UIImageView * NameImage = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 40, 40)];
        NameImage.image = [UIImage imageNamed:@"i-name.jpg"];
    [inputAdressView addSubview:NameImage];
    
    UIImageView * telephoneImage = [[UIImageView alloc]initWithFrame:CGRectMake(16, 56, 23 , 41)];
        telephoneImage.image = [UIImage imageNamed:@"i-phone.jpg"];
    [inputAdressView addSubview:telephoneImage];
    
    UIImageView * locationImage = [[UIImageView alloc]initWithFrame:CGRectMake(16, 110 , 23, 35)];
        locationImage.image = [UIImage imageNamed:@"i-adress.jpg"];
    [inputAdressView addSubview:locationImage];
    
    UIImageView * cutline1 = [[UIImageView alloc]initWithFrame:CGRectMake(7, 50, 400, 1)];
    cutline1.image = [UIImage imageNamed:@"greenline.jpg"];
    [inputAdressView addSubview:cutline1];
    UIImageView * cutline2 = [[UIImageView alloc]initWithFrame:CGRectMake(7, 100, 400, 1)];
    cutline2.image = [UIImage imageNamed:@"greenline.jpg"];
    [inputAdressView addSubview:cutline2];
    UIImageView * cutline3 = [[UIImageView alloc]initWithFrame:CGRectMake(7, 150, 400, 1)];
    cutline3.image = [UIImage imageNamed:@"greenline.jpg"];
    [inputAdressView addSubview:cutline3];
    
    UILabel * AdressNameLab = [[UILabel alloc]initWithFrame:CGRectMake(55, 12, 67, 35)];
    AdressNameLab.text = @"姓名:";
    [inputAdressView addSubview:AdressNameLab];
    
    UILabel * AddressTelephoneLab = [[UILabel alloc]initWithFrame:CGRectMake(55, 61, 67, 35 )];
    AddressTelephoneLab.text = @"电话:";
    [inputAdressView addSubview:AddressTelephoneLab];
    
    UILabel * AddressCityLab = [[UILabel alloc]initWithFrame:CGRectMake(55, 111, 102, 35)];
    AddressCityLab.text = @"省、市、区：";
    [inputAdressView addSubview:AddressCityLab];
    
    UILabel * AdressCityLocationLab = [[UILabel alloc]initWithFrame:CGRectMake(55, 160, 102, 35)];
    AdressCityLocationLab.text = @"详细地址：";
    [inputAdressView addSubview:AdressCityLocationLab];
    
    self.AdressName = [[UITextField alloc]initWithFrame:CGRectMake(100, 15, 300, 30)];
    self.AdressName.borderStyle = UITextBorderStyleNone;
    [inputAdressView addSubview:self.AdressName];
    
    self.AdressTelephone = [[UITextField alloc]initWithFrame:CGRectMake(100, 64, 300, 30)];
    self.AdressTelephone.borderStyle = UITextBorderStyleNone;
    self.AdressTelephone.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [inputAdressView addSubview:self.AdressTelephone];
    
    self.AdreessCity = [[UITextField alloc]initWithFrame:CGRectMake(148, 114, 258, 30)];
    [inputAdressView addSubview:self.AdreessCity];
    
    UIButton * cityBtn = [[UIButton alloc]initWithFrame:CGRectMake(148, 100, 260, 52)];
    [cityBtn addTarget:self action:@selector(selectorCity) forControlEvents:UIControlEventTouchUpInside];
    [inputAdressView addSubview:cityBtn];
    
    self.AdreessInputLocation = [[UITextField alloc]initWithFrame:CGRectMake(55, 188, 348, 54)];
    self.AdreessInputLocation.borderStyle = UITextBorderStyleNone;
    [inputAdressView addSubview:self.AdreessInputLocation];
    
    [self.view addSubview:inputAdressView];
}
-(void)saveadress{
    if ([_AdreessCity.text isEqual:@""]||[_AdreessInputLocation.text isEqual:@""]||[_AdressName.text isEqual:@""]||[_AdressTelephone.text isEqual:@""]) {
        UIAlertView * winnerview = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请检查，填写内容不能为空!"     delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [winnerview show];
    }else {
        
        NSMutableDictionary *dictionary1 = [[NSMutableDictionary alloc] init];
        [dictionary1 setValue:self.AdressName.text forKey:@"name"];
        [dictionary1 setValue:self.AdressTelephone.text forKey:@"telephone"];
        [dictionary1 setValue:self.AdreessCity.text forKey:@"city"];
        [dictionary1 setValue:self.AdreessInputLocation.text forKey:@"address"];
        NSLog(@"%@",dictionary1);
//        NSString * addressPath = [[NSBundle mainBundle]pathForResource:@"ManageAdress.plist" ofType:nil];
        
        NSString * sandboxPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        NSLog(@"%@",sandboxPath);
        NSString *fileName = [sandboxPath stringByAppendingPathComponent:@"cityCode.plist"];
        
//        NSFileManager *fm = [NSFileManager defaultManager];
//        if ([fm createFileAtPath:fileName contents:nil attributes:nil] ==YES) {
//            NSLog(@"%@",fileName);
            [dictionary1 writeToFile:fileName atomically:YES];
        /*
         要用地址数据就从 fileName 去拿出来
         */
            NSLog(@"文件写入完成");
                    NSDictionary *dict2  =  [NSDictionary dictionaryWithContentsOfFile:fileName];
            NSLog(@"%@",dict2);
        }
//    }
}

-(void)selectorCity{
    TSLocateView *locateView = [[TSLocateView alloc] initWithTitle:@"选择城市" delegate:self];
    [locateView showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    TSLocateView *locateView = (TSLocateView *)actionSheet;
    TSLocation *location = locateView.locate;
    NSLog(@"city:%@ lat:%f lon:%f", location.city, location.latitude, location.longitude);
    self.AdreessCity.text = location.city;
    //You can uses location to your application.
    if(buttonIndex == 0) {
        NSLog(@"Cancel");
    }else {
        NSLog(@"Select");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
