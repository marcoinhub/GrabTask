//
//  AboutUsViewController.m
//  kankun我的界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelText;//介绍一
@property (weak, nonatomic) IBOutlet UILabel *labelText2;//介绍二
@property (weak, nonatomic) IBOutlet UILabel *labelText3;//介绍三

@end

@implementation AboutUsViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"关于我们";
    self.labelText.text=@"一起来抢是听说伯乐相马又出新招了，听说伯乐相马又出先找了";
    self.labelText2.text=@"阿卡结婚的算了快放假哈；耦合度佛啊华东师范看见俺不看时间段被罚款基本上都分开酒吧看时间段办法会计师的发哦坚实的风景好时间段回复";
    
    
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
