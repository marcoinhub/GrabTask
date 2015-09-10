//
//  MineViewController.m
//  GrabTask
//
//  Created by 汤阳晋 on 15/9/10.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    
    NSMutableArray * icon = [[NSMutableArray alloc] initWithObjects:@"i-youhuiquan.png",@"i-qianbao.png",@"i-dizhi.png",@"i-women.png",@"i-heip.png"@"i-yijian.png",@"i-kefu.png",@"i-lianmeng.png",@"i-painming.png",@"i-shanghu.png",@"i-shezhi.png", nil];

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
    static NSString *identifier=@"MineTableViewCell";
    MineTableViewCell *cell=(MineTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        
        NSArray *views=[[NSBundle mainBundle]loadNibNamed:identifier owner:nil options:nil];
        cell=[views objectAtIndex:0];
        
    }
    
    cell.imageView.image =[UIImage imageNamed:@"i-youhuiquan.png"];
    cell.titleLabel.text = @"我的优惠券";
    
    return cell;
    
    
}

@end











































