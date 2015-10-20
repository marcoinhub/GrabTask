//
//  afterShareTableViewController.m
//  shareSucessed
//
//  Created by MBZL on 15/10/19.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "afterShareTableViewController.h"

@interface afterShareTableViewController ()

@property (strong, nonatomic) IBOutlet UIView *headView;
@property (strong, nonatomic) IBOutlet UITableViewCell *wantCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *companyCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *countCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *awardlist;
@property (strong, nonatomic) IBOutlet UITableViewCell *awardRankCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *awardIntroduceCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *activityNotice;
@property (strong, nonatomic) IBOutlet UITableViewCell *activityIntroduce;

@end

@implementation afterShareTableViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableHeaderView:_headView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 3;
            break;
        default:
            return 1;
    }

#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
 
        case 0:
            
            switch (indexPath.row) {
                case 0:
                    return _wantCell;
                    break;
                case 1:
                    return _companyCell;
                    break;
                case 2:
                    return _countCell;
                    break;
                default:
                    break;
            }
            break;
   //---------------------------------------------------------
        case 1:
            switch (indexPath.row) {
                case 0:
                    return _awardlist;
                    break;
                case 1:
                    return _awardRankCell;
                default:
                    break;
            }
            break;
//-------------------------------------------------------------
        case 2:
            switch (indexPath.row) {
                case 0:
                    return _activityIntroduce;
                    break;
                case 1:
                    return
                    _awardIntroduceCell;
                    break;
                case 2:
                    return _activityNotice;
                    break;

                default:
                    break;
            }
            break;
//------------------------------------------------------
        default:
            return nil;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    switch (indexPath.section) {
            
        case 0:
            
            switch (indexPath.row) {
                case 0:
                    return 44;
                    break;
                case 1:
                    return 44;
                    break;
                case 2:
                    return 44;
                    break;
                default:
                    break;
            }
            break;
            //---------------------------------------------------------
        case 1:
            switch (indexPath.row) {
                case 0:
                    return 88;
                    break;
                case 1:
                    return 160;
                default:
                    break;
            }
            break;
            //-------------------------------------------------------------
        case 2:
            switch (indexPath.row) {
                case 0:
                    return 60;
                    break;
                case 1:
                    return
                    60;
                    break;
                case 2:
                    return 60;
                    break;
                    
                default:
                    break;
            }
            break;
            //------------------------------------------------------
        default:
            return 0;    }
    
    return 44;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
