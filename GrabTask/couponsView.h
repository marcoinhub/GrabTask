//
//  couponsView.h
//  GrabTask
//
//  Created by MBZL on 15/10/13.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "coupons.h"
@interface couponsView : UIView
@property(nonatomic,strong)coupons * singleCoupons;
@property(nonatomic,strong)UIImageView* imageView;
@property(nonatomic,strong)UILabel *  wantLabel;
@property(nonatomic,strong)UILabel *  locationLabel;
@property(nonatomic,strong)UILabel *  companyLabel;
@property(nonatomic,strong)UIButton*
button;
@property(nonatomic,strong)NSMutableArray* allcoupons;
-(void)setDataWithDictionary:(NSDictionary *)dic;
@end
