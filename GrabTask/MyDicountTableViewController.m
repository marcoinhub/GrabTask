
//
//  MyDicountTableViewController.m
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyDicountTableViewController.h"
#import "DiscountCellFrame.h"
#import "DiscountModel.h"
#import "DiscountTableViewCell.h"
@interface MyDicountTableViewController ()
@property(nonatomic,strong)NSArray * Discount;
@end

@implementation MyDicountTableViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(NSArray*)Discount{
    if (_Discount==nil) {
        //提取plist
        NSString * path = [[NSBundle mainBundle]pathForResource:@"DiscountView.plist" ofType:nil];
        //加载数组
        NSArray  * dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * dicountframes = [NSMutableArray array];
        NSLog(@"%@",dictArray);
        for (NSDictionary*dict in dictArray) {
            DiscountModel * discount = [DiscountModel initDiscountWithDict:dict];
            DiscountCellFrame * discountframe = [[DiscountCellFrame alloc]init];
            NSLog(@"%@",discountframe);
            discountframe.discountModel = discount;
            [dicountframes addObject:discountframe];

        }
        _Discount =dicountframes;
    }
    return _Discount;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"%lu",self.Discount.count);
    return self.Discount.count;
}
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
//    if (indexPath==0) {
//    DiscountTableViewCell *cell = [DiscountTableViewCell cellWithTableView:tableView];
//    //设置高度
//    cell.discountCellFrame = self.Discount[indexPath.row];
//    //返回cell
//        return cell;
//    }
    DiscountTableViewCell *cell = [DiscountTableViewCell cellWithTableView:tableView];
    //设置高度
    cell.discountCellFrame = self.Discount[indexPath.row];
    //返回cell
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取出这行对应的frame模型
    return 160.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{//表尾
    return 1.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section//表头
{
    return 20.0;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
