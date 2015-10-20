//
//  DiscountTableViewCell.m
//  优惠券界面
//
//  Created by apple on 15/10/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DiscountTableViewCell.h"
#import "DiscountModel.h"
#import "DiscountCellFrame.h"

#define TitleFont [UIFont systemFontOfSize:14]
#define InfoFont [UIFont systemFontOfSize:8]

@implementation DiscountTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //图片
        UIImageView * IconView = [[UIImageView alloc]init];
        [self.contentView addSubview:IconView];
        self.DiscountIconView=IconView;
        //标题
        UILabel * TitleLab = [[UILabel alloc]init];
        [self.contentView addSubview:TitleLab];
        self.DiscounTitle=TitleLab;
        
        //商家
        UILabel * ShopLab = [[UILabel alloc]init];
        ShopLab.font = TitleFont;
        [self.contentView addSubview:ShopLab];
        self.DiscountShop = ShopLab;
        
        //参与时间
        UILabel* joinTimeLab =[[UILabel alloc]init];
        joinTimeLab.font = TitleFont;
        [self.contentView addSubview:joinTimeLab];
        self.DiscoutJoinTime = joinTimeLab;
        
        //代金券
        _DiscountCDK=[[UILabel alloc]init];
        _DiscountCDK.font = TitleFont;
        [self.contentView addSubview:_DiscountCDK];
        
        //切割线
        _DiscountCutLine=[[UIImageView alloc]init];
        [self.contentView addSubview:_DiscountCutLine];
        
        //查看按钮
        _DiscountCheck=[[UIButton alloc]init];
        [self.contentView addSubview:_DiscountCheck];
        
     }
    return self;
}
-(void)setDiscountCellFrame:(DiscountCellFrame *)discountCellFrame{
    _discountCellFrame = discountCellFrame;
    //给子控件设置数据
    [self settingData];
    //给子控件设置frame
    [self settingFrame];
    
}
//设置数据
-(void)settingData{
    DiscountModel * discountmodel = self.discountCellFrame.discountModel;
    //头像
    self.DiscountIconView.image = [UIImage imageNamed:discountmodel.icon];
    
    self.DiscountCutLine.image = [UIImage imageNamed:discountmodel.line];
    //标题
    
    self.DiscounTitle.text  = discountmodel.title;
    //商家
    self.DiscountShop.text  = discountmodel.shop;
    //参与时间
    self.DiscoutJoinTime.text = discountmodel.jointime;
    //CDK
    self.DiscountCDK.text  = discountmodel.discountCDK;
    //查看
    [self.DiscountCheck setTitle:discountmodel.check forState:UIControlStateNormal];
    [self.DiscountCheck setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.DiscountCheck.layer.borderWidth = 1;//喵边宽
    self.DiscountCheck.layer.borderColor = [[UIColor lightGrayColor]CGColor];//喵边颜色
    self.DiscountCheck.layer.cornerRadius = 20.0;//按钮圆角
}
-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return  [text boundingRectWithSize: maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
//设置frame
-(void)settingFrame{
    //标题
    self.DiscounTitle.frame = self.discountCellFrame.titleF;
    //商家
    self.DiscountShop.frame = self.discountCellFrame.shopF;
    //参加时间
    self.DiscoutJoinTime.frame = self.discountCellFrame.jointimeF;
    //切割线
    self.DiscountCutLine.frame = self.discountCellFrame.lineF;
    //团购券
    self.DiscountCDK.frame  = self.discountCellFrame.cdkeyF;
    //图片
    self.DiscountIconView.frame= self.discountCellFrame.iconF;
    //按钮
    self.DiscountCheck.frame = self.discountCellFrame.checkF;
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
static NSString * id = @"discountmodel";
    DiscountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell = [[DiscountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    return cell;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
