//
//  DiscountCellFrame.m
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DiscountCellFrame.h"
#import "DiscountModel.h"
#define TitleFont [UIFont systemFontOfSize:14]
#define InfoFont [UIFont systemFontOfSize:8]

@implementation DiscountCellFrame
-(void)setDiscountModel:(DiscountModel *)discountModel{

    _discountModel = discountModel;
    _iconF = CGRectMake(10, 10, 100, 100);
    _titleF = CGRectMake(135, 10, 260, 35);
    _shopF = CGRectMake(135, 55, 120, 20);
    _jointimeF = CGRectMake(135, 91, 250, 20);
    _lineF  = CGRectMake(0, 125, 414, 2);
    _checkF = CGRectMake(300, 45, 90, 35);
    _cdkeyF = CGRectMake(10, 135, 400, 20);
    
    _cellHeight = 40.0;
}

-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return  [text boundingRectWithSize: maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
