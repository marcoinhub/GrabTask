//
//  TaskViewController.h
//  GrabTask
//
//  Created by 汤阳晋 on 15/9/10.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskTableViewCell.h"

@interface TaskViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
