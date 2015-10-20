//
//  HelpCenterViewController.m
//  kankun我的界面
//
//  Created by apple on 15/10/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HelpCenterViewController.h"

@interface HelpCenterViewController ()

@end

@implementation HelpCenterViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"帮助中心";
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
