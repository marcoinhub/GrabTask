//
//  DiscountCellFrame.h
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DiscountModel;
@interface DiscountCellFrame : NSObject
//图片的frame
@property(nonatomic, assign, readonly) CGRect iconF;
//标题的frame
@property(nonatomic, assign, readonly) CGRect titleF;
//商家的frame
@property(nonatomic, assign, readonly) CGRect shopF;
//参加时间的frame
@property(nonatomic, assign, readonly) CGRect jointimeF;
//图片的frame
@property(nonatomic, assign, readonly) CGRect cdkeyF;
//分割线
@property(nonatomic, assign, readonly) CGRect lineF;
//查看按钮
@property(nonatomic, assign, readonly) CGRect checkF;

//cell的高度
@property(nonatomic, assign, readonly) CGFloat cellHeight;


@property (nonatomic,strong)DiscountModel * discountModel;

@end
