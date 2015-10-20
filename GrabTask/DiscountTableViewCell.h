//
//  DiscountTableViewCell.h
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiscountCellFrame;
@interface DiscountTableViewCell : UITableViewCell
@property(nonatomic,strong)DiscountCellFrame * discountCellFrame;

@property(nonatomic,strong)UIImageView * DiscountIconView;//店铺图片
@property(nonatomic,strong)UIImageView * DiscountCutLine;//分割线
@property(nonatomic,strong)UILabel* DiscounTitle;//标题
@property(nonatomic,strong)UILabel* DiscountShop;//商家
@property(nonatomic,strong)UILabel* DiscoutJoinTime;//参与时间
@property(nonatomic,strong)UILabel* DiscountCDK;//代金券
@property(nonatomic,strong)UIButton* DiscountCheck;//查看

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
