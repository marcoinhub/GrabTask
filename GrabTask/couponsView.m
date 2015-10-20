//
//  couponsView.m
//  GrabTask
//
//  Created by MBZL on 15/10/13.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "couponsView.h"
#import "coupons.h"
#import "ActivityDetailsViewController.h"
#define DEFAULT_FONT(s)     [UIFont fontWithName:@"Marker Felt" size:s]
@implementation couponsView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(8, 8, 193, 187)];
        _button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 500, 500)];
        _locationLabel=[[UILabel alloc]initWithFrame:CGRectMake(8, 241, 193, 30)];
        _locationLabel.textColor=[UIColor colorWithRed:0.52 green:0.52 blue:0.52 alpha:1];
        _wantLabel=[[UILabel alloc]initWithFrame:CGRectMake(8, 198, 193, 40)];
        _companyLabel=[[UILabel alloc]initWithFrame:CGRectMake(8, 277, 193, 15)];
        _companyLabel.textColor=[UIColor colorWithRed:0.52 green:0.52 blue:0.52 alpha:1];
        _locationLabel.font=DEFAULT_FONT(17);
        
        _wantLabel.font=DEFAULT_FONT(25);
        _wantLabel.adjustsFontSizeToFitWidth=YES;
        _companyLabel.font=DEFAULT_FONT(17);
        _companyLabel.adjustsFontSizeToFitWidth=YES;
        _locationLabel.numberOfLines=0;
        _locationLabel.adjustsFontSizeToFitWidth=YES;
        _wantLabel.numberOfLines=0;
        _companyLabel.numberOfLines=0;
        [self addSubview:_button];
        [self addSubview:_imageView];
        [self addSubview:_locationLabel];
        [self addSubview:_wantLabel];
        [self  addSubview:_companyLabel];
        [self addSubview:_imageView];
        
    }
    return self;
}
-(void)setDataWithDictionary:(NSDictionary *)dic{
        if (self) {
        _singleCoupons=[[coupons alloc]initWithDic:dic];
        self.imageView.image=[UIImage imageNamed:_singleCoupons.image];
        self.wantLabel.text=_singleCoupons.want;
        self.locationLabel.text=_singleCoupons.location;
        self.companyLabel.text=_singleCoupons.company;

    }


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
