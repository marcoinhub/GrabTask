//
//  coupons.m
//  GrabTask
//
//  Created by MBZL on 15/10/13.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "coupons.h"

@implementation coupons
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
       
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
