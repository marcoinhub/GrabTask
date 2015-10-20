//
//  ActivityDetailsViewController.m
//  GrabTask
//
//  Created by 汤阳晋 on 15/10/19.
//  Copyright © 2015年 John. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "AchieveSuccessViewController.h"
#import "afterShareTableViewController.h"
@interface ActivityDetailsViewController ()
@property (strong, nonatomic) IBOutlet UIButton *achieveDiscount;

@end

@implementation ActivityDetailsViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    
    [self.tableView setTableHeaderView:_headView];
    [super viewDidLoad];
    [self.achieveDiscount
     addTarget:self action:@selector(achieveSucess) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
-(void)achieveSucess{
    AchieveSuccessViewController * ac=[[AchieveSuccessViewController alloc]initWithNibName:@"AchieveSuccessViewController" bundle:nil];
    [self.navigationController pushViewController:ac animated:YES];


}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 3;
        case 1:
            return 5;
        case 2:
            return 1;
        case 3:
            return 1;
        default:
            return 1;
    }
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    return _introduction;
                case 1:
                    return _shop;
                case 2:
                    return _award;
                    
            }
            
        case 1:
            switch (indexPath.row) {
                case 0:
                    return _receive;
                case 1:
                    return _exchange;
                case 2:
                    return _condition;
                case 3:
                    return _range;
                case 4:
                    return _shopIntroduction;
                    
            }
            
        case 2:
            switch (indexPath.row){
                case 0:
                    return _notes;
                    
            }
        case 3:
            switch (indexPath.row) {
                case 0:
                    return _get;
            }
            
        default:
            return nil;
            
            
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    return 44;
                case 1:
                    return 44;
                case 2:
                    return 44;
                    
            }
            
        case 1:
            return 88;
            break;
            
            
    }
    return 88;


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    afterShareTableViewController * afterShareTableView =[[afterShareTableViewController alloc]initWithNibName:@"afterShareTableViewController" bundle:nil];
    
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 2:
                    [self.navigationController pushViewController:afterShareTableView animated:YES];
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }

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
