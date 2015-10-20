//
//  ActivityDetailsViewController.h
//  GrabTask
//
//  Created by 汤阳晋 on 15/10/19.
//  Copyright © 2015年 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityDetailsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIView *headView;
@property (strong, nonatomic) IBOutlet UITableViewCell *introduction;
@property (strong, nonatomic) IBOutlet UITableViewCell *shop;
@property (strong, nonatomic) IBOutlet UITableViewCell *award;
@property (strong, nonatomic) IBOutlet UITableViewCell *receive;
@property (strong, nonatomic) IBOutlet UITableViewCell *exchange;
@property (strong, nonatomic) IBOutlet UITableViewCell *condition;
@property (strong, nonatomic) IBOutlet UITableViewCell *range;
@property (strong, nonatomic) IBOutlet UITableViewCell *shopIntroduction;
@property (strong, nonatomic) IBOutlet UITableViewCell *notes;
@property (strong, nonatomic) IBOutlet UITableViewCell *get;
@end
