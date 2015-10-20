//
//  DrawCashTableViewController.m
//  现金提现
//
//  Created by apple on 15/10/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DrawCashTableViewController.h"
#import "bundlingViewController.h"
#import "AliPayDetailedViewController.h"
#define chooseColor [UIColor colorWithRed:0.44 green:0.81 blue:0.76 alpha:1]
@interface DrawCashTableViewController ()<UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UILabel *AliPayAccount;

@end

@implementation DrawCashTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"现金提现";

    self.TakeOutText.text = @"请输入转账金额";
    UIButton * takeout = [[UIButton alloc]initWithFrame:CGRectMake(7, 369, 400, 30)];
    takeout.backgroundColor =  chooseColor;
    [takeout setTitle:@"提交" forState:UIControlStateNormal];
    [takeout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [takeout addTarget:self action:@selector(inputTakeOutButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:takeout];
    
  
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{
    NSString * sandboxPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSLog(@"%@",sandboxPath);
    NSString *fileName = [sandboxPath stringByAppendingPathComponent:@"AliAccountCode.plist"];
    NSDictionary *dict2  =  [NSDictionary dictionaryWithContentsOfFile:fileName];
    NSString*text=[dict2 objectForKey:@"AliAccount"];
    if (text) {
        NSLog(@"有");
        self.AliPayAccount.text = text;
    }else{
        NSLog(@"空");
        self.AliPayAccount.text = @"绑定支付宝";
    }
}
-(void)inputTakeOutButton{
    NSString * sandboxPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSLog(@"%@",sandboxPath);
    NSString *fileName = [sandboxPath stringByAppendingPathComponent:@"AliAccountCode.plist"];
    NSDictionary *dict2  =  [NSDictionary dictionaryWithContentsOfFile:fileName];
    NSString*text=[dict2 objectForKey:@"AliMoney"];
    NSInteger lingshi = [text integerValue];
    
    if ([self.TakeOutText.text isEqual:@""]||[self.TakeOutText.text integerValue]>lingshi) {
        UIAlertView * Warning = [[UIAlertView alloc]initWithTitle:@"提示" message:@"填写有误!"     delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [Warning show];
    }else {
        NSInteger  i = [text integerValue]+[self.TakeOutText.text integerValue];
        NSString * changgeMoney = [NSString stringWithFormat:@"%lu",i];
        [dict2 setValue:changgeMoney forKey:@"AliMoney"];
        [dict2 writeToFile:fileName atomically:YES];
        UIAlertView * Warning = [[UIAlertView alloc]initWithTitle:@"提示" message:@"提现成功!"     delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [Warning show];
    }
}

- (IBAction)DrawCash:(UITextField *)sender {

    NSLog(@"%@",self.TakeOutText.placeholder);
    self.TakeOutText.text=self.TakeOutText.placeholder;
    NSLog(@"%@",self.TakeOutText.placeholder);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return 2;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell=self.AliPay;
            return cell;
        }
        cell = self.MyProfit;
        return cell;
    }
    cell = self.TakeOutMoney;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    switch (indexPath.section) {
        case 0:
            if (indexPath.row==0) {
                if ([self.AliPayAccount.text isEqualToString:@"绑定支付宝"]) {
                    bundlingViewController * bundlingAlipay = [[bundlingViewController alloc]init];
                    
                    [self.navigationController pushViewController:bundlingAlipay animated:YES];

                }else{
                    AliPayDetailedViewController * AliPayDetailed = [[AliPayDetailedViewController alloc]init];
                    [self.navigationController pushViewController:AliPayDetailed animated:YES];
                }
            }
            break;
            
        case 1:
            
            break;
        default:
            break;
    }
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
