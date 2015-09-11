//
//  MineViewController.h
//  GrabTask
//
//  Created by 汤阳晋 on 15/9/10.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineTableViewCell.h"

@interface MineViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet MineTableViewCell *taskCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *walletCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *addressCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *aboutCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *helpCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *
    ideaCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *serviceCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *friendCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *rankCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *memberCell;
@property (strong, nonatomic) IBOutlet MineTableViewCell *settingkCell;
@end
