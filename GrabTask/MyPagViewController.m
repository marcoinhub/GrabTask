//
//  MyPagViewController.m
//  我的de钱包
//
//  Created by apple on 15/10/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyPagViewController.h"
#import "DrawCashTableViewController.h"
@interface MyPagViewController ()
@property (strong, nonatomic) IBOutlet UILabel *forwardMoney;
@property (strong, nonatomic) IBOutlet UILabel *praiseMoney;
@property (strong, nonatomic) IBOutlet UILabel *commentMoney;
@property (strong, nonatomic) IBOutlet UILabel *friendMoney;
@property (strong, nonatomic) IBOutlet UILabel *registerMoney;
@property (strong, nonatomic) IBOutlet UILabel *gameMoney;

@end

@implementation MyPagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButton*navImage=[UIButton buttonWithType:UIButtonTypeCustom];
//    [navImage setImage:[UIImage imageNamed:@"("] forState:UIControlStateNormal];
//    navImage.frame=CGRectMake(0, 0, 9,15);
//    [navImage addTarget:self action:@selector(backShow) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem*item=[[UIBarButtonItem alloc]initWithCustomView:navImage];
//    self.navigationItem.leftBarButtonItem=item;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;


}
-(void)viewWillDisappear:(BOOL)animated{
self.tabBarController.tabBar.hidden=NO;
}
-(void)backShow{



}
- (IBAction)Help:(UIButton *)sender {
    
}
//现金提取
- (IBAction)GotoTakeMeney:(UIButton *)sender {
    DrawCashTableViewController * dctvc = [[DrawCashTableViewController alloc]initWithNibName:@"DrawCashTableViewController" bundle:nil];
    [self.navigationController pushViewController:dctvc animated:YES];
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
