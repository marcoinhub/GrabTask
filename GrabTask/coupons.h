//
//  coupons.h
//  GrabTask
//
//  Created by MBZL on 15/10/13.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface coupons : NSObject
@property(nonatomic,strong)NSString * image;//图片
@property(nonatomic,strong)NSString * want;//广告
@property(nonatomic,strong)NSString * location;//地址
@property(nonatomic,strong)NSString * company;//公司
-(instancetype)initWithDic:(NSDictionary*)dic;//初始化数据
@end
