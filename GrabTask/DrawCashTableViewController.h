//
//  DrawCashTableViewController.h
//  现金提现
//
//  Created by apple on 15/10/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawCashTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableViewCell *AliPay;
@property (strong, nonatomic) IBOutlet UITableViewCell *MyProfit;
@property (strong, nonatomic) IBOutlet UITableViewCell *TakeOutMoney;
@property (strong, nonatomic) IBOutlet UITextField *TakeOutText;

@end
