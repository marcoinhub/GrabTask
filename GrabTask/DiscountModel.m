//
//  DiscountModel.m
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DiscountModel.h"

@implementation DiscountModel
-(id)initWithDict:(NSDictionary *)dict{
    
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(id)initDiscountWithDict:(NSDictionary *)dict{
    return  [[self alloc ]initWithDict:dict];
}

@end
