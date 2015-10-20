//
//  DiscountModel.h
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscountModel : NSObject
@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, copy) NSString *shop; // 商家
@property (nonatomic, copy) NSString *jointime; // 用的时间
@property (nonatomic, copy) NSString *discountCDK; // 代金券密码
@property (nonatomic, copy) NSString *icon; // 配图
@property (nonatomic, copy) NSString *check;//查看
@property (nonatomic,copy)NSString * line;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)initDiscountWithDict:(NSDictionary *)dict;
@end
