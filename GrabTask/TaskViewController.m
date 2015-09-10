//
//  TaskViewController.m
//  GrabTask
//
//  Created by 汤阳晋 on 15/9/10.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "TaskViewController.h"

@interface TaskViewController ()

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 240;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier=@"TaskTableViewCell";
    TaskTableViewCell *cell=(TaskTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        
        NSArray *views=[[NSBundle mainBundle]loadNibNamed:identifier owner:nil options:nil];
        cell=[views objectAtIndex:0];
        
    }
    
    return cell;
    
    
}
@end
