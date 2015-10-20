//
//  MineViewController.m
//  GrabTask
//
//  Created by 汤阳晋 on 15/9/10.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "MineViewController.h"
#import "MyDicountTableViewController.h"//我的优惠券
#import "addAddressViewController.h"//地址管理
#import "AboutUsViewController.h"//关于我们
#import "HelpCenterViewController.h"//帮助中心
#import "ReturnIdeasViewController.h"//意见反馈
#import "SystemSetTableViewController.h"//系统设置
#import "MyPagViewController.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [self.tableView setTableHeaderView:_topView];
    
//    NSMutableArray * icon = [[NSMutableArray alloc] initWithObjects:@"i-youhuiquan.png",@"i-qianbao.png",@"i-dizhi.png",@"i-women.png",@"i-heip.png"@"i-yijian.png",@"i-kefu.png",@"i-lianmeng.png",@"i-painming.png",@"i-shanghu.png",@"i-shezhi.png", nil];

    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 3;
        case 1:
            return 4;
        case 2:
            return 2;
        case 3:
            return 2;
     default:
            return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    return _taskCell;
                case 1:
                    return _walletCell;
                case 2:
                    return _addressCell;
                    
            }
            
        case 1:
            switch (indexPath.row) {
                case 0:
                    return _aboutCell;
                case 1:
                    return _helpCell;
                case 2:
                    return _ideaCell;
                case 3:
                    return _serviceCell;
                    
            }
            
        case 2:
            switch (indexPath.row){
            case 0:
                return _friendCell;
            case 1:
                    return _rankCell;

            }
        case 3:
            switch (indexPath.row) {
                case 0:
                    return _memberCell;
                    break;
                case 1:
                    return _settingkCell;

            }
            
            default:
            return nil;
   
    
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyDicountTableViewController * mydicouny=[[MyDicountTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    addAddressViewController * addAddressView=[[addAddressViewController alloc]init];
    AboutUsViewController* aboutUsView=[[AboutUsViewController alloc]init];
    HelpCenterViewController* helpCenterView=[[HelpCenterViewController alloc]init];
    ReturnIdeasViewController * returnIdeas=[[
    ReturnIdeasViewController alloc
                                          ]init];
    SystemSetTableViewController *
    systemSet=
    [[SystemSetTableViewController alloc]init];
    MyPagViewController *
    myPagView=
    [[MyPagViewController alloc]init];
    
    switch (indexPath.section) {
//------------section 1-----------------//
        case 0:
            switch (indexPath.row) {
                case 0:
                    [self.navigationController pushViewController:mydicouny animated:YES];
                    break;
                case 1:
                    [self.navigationController pushViewController:myPagView animated:YES];
                    break;
                case 2:
                    [self.navigationController pushViewController:addAddressView animated:YES];
                    break;
                //
                default:
                    break;
            }
            break;
            
//---------section2----------------//
            case 1:
            switch (indexPath.row) {
                case 0:
                    [self.navigationController pushViewController:aboutUsView animated:YES];
                    break;
                case 1:
                    [self.navigationController pushViewController:helpCenterView animated:YES];
                    break;
                case 2:
                    [self.navigationController pushViewController:returnIdeas animated:YES];
                    break;
               //
                default:
                    break;
            }
            break;
//------------section3-----------------//
         case 3:
            switch (indexPath.row) {
                case 1:
                    [self.navigationController pushViewController:systemSet animated:YES];
                    break;
                    
                default:
                    break;
            }
 //------------------------------------//
        default:
            break;
    }
    


}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{




}
@end











































