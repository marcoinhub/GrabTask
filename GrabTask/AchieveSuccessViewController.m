//
//  AchieveSuccessViewController.m
//  GrabTask
//
//  Created by 汤阳晋 on 15/10/19.
//  Copyright © 2015年 John. All rights reserved.
//

#import "AchieveSuccessViewController.h"

@interface AchieveSuccessViewController ()

@end

@implementation AchieveSuccessViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
