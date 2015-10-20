//
//  HomeViewController.m
//  GrabTask
//
//  Created by 汤阳晋 on 15/9/10.
//  Copyright (c) 2015年 John. All rights reserved.
//
#import "HomeViewController.h"
#import "couponsView.h"
#import "ActivityDetailsViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//应用尺寸
#define APP_WIDTH [[UIScreen mainScreen]applicationFrame].size.width
#define APP_HEIGHT [[UIScreen mainScreen]applicationFrame].size.height
#define DEFAULT_FONT(s)     [UIFont fontWithName:@"娃娃体" size:s]
#define SCROLLVIEWHEIGH 335
#define chooseColor [UIColor colorWithRed:0.44 green:0.81 blue:0.76 alpha:1]

typedef NS_ENUM(NSInteger,chooseState ){
    isDefaultStata=0,
    isNewestStata=1,
    isHotestState=2,
    
};

@interface HomeViewController ()
@property(nonatomic,strong)couponsView *coupons;
@property(nonatomic,strong)UIScrollView*bottomScrollerView;
@property(nonatomic,strong)UIScrollView*bottomNewScrollerView;
@property(nonatomic,strong)UIScrollView*bottomHotScrollerView;
@property(nonatomic,strong)NSMutableArray* currentCoupons;
@property(nonatomic,strong)UIButton* newesetRecommend;
@property(nonatomic,strong)UIButton* hotestRecommend;
@property chooseState state;
-(NSArray*)companyLogoImage;

@end



@implementation HomeViewController
//懒加载传入文档的数组
-(NSMutableArray*)currentCoupons{

    if (_currentCoupons==nil) {
        _currentCoupons=[NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"allNewCoupon.plist" ofType:nil]];
    }
    return _currentCoupons;
}
-(NSArray*)companyLogoImage{
    
    return @[@"logo-hooters.png",@"logo-pizza.png",@"logo-可口可乐.png",@"logo-哈格达斯.png"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWitPage];
    [self changeButtonColor];
    // Do any additional setup after loading the view from its nib.
}
-(void)initWitPage{
    [self setTitle:@"一起来抢"];
    //限时豪礼
    UIImageView * limitedGift=[[UIImageView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 148)];
    limitedGift.image=[UIImage imageNamed:@"gg1.jpg"];
    [self.view addSubview:limitedGift];
    //优质商家
    UILabel * company=[[UILabel alloc]initWithFrame:CGRectMake(0, 206, SCREEN_WIDTH, 39)];
    company.text=@"优质商家";
    company.font=DEFAULT_FONT(15);
    company.textAlignment=1;
    [self.view addSubview:company];
    //优质商家logo
    UIScrollView * companyLogo=[[UIScrollView  alloc] initWithFrame:CGRectMake(0,243, SCREEN_WIDTH, 71)];
    
    for (NSInteger i=0; i<self.companyLogoImage.count; i++) {
        UIImageView * logo=[[UIImageView alloc]initWithFrame:CGRectMake(companyLogo.frame.size.width*i/4, 0, SCREEN_WIDTH/4, companyLogo.frame.size.height)];
        UIImage* image=[UIImage imageNamed:self.companyLogoImage[i]];
        logo.image=image;
        UIButton * logoButton=[[UIButton alloc]initWithFrame:logo.frame];
        [companyLogo addSubview:logo];
        [companyLogo addSubview:logoButton];
    }
    companyLogo.contentSize=CGSizeMake(companyLogo.frame.size.width*self.companyLogoImage.count, companyLogo.frame.size.height);
    //不可弹跳
    companyLogo.bounces=NO;
    //关闭水平滚动指示器
    companyLogo.showsHorizontalScrollIndicator=NO;
    //设置整页滑动
    companyLogo.pagingEnabled=YES;
    [self.view addSubview:companyLogo];
    //最新推荐
    UIButton * newesetRecommend=[[UIButton alloc] initWithFrame:CGRectMake(0, 315, SCREEN_WIDTH/2, 40)];
    [newesetRecommend setTitle:@"最新推荐" forState:0];
    [newesetRecommend setTitleColor:[UIColor blackColor] forState:0];
    [newesetRecommend addTarget:self action:@selector(chooserNewList:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:newesetRecommend];
    self.newesetRecommend=newesetRecommend;
    [_newesetRecommend setBackgroundImage:[UIImage imageNamed:@"buttonBak.png"] forState:0];

    //最热推荐
    UIButton * hotestRecommend=[[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 315, SCREEN_WIDTH/2, 40)];
    [hotestRecommend setTitle:@"最热推荐" forState:0];
    [hotestRecommend setTitleColor:[UIColor blackColor] forState:0];
    [hotestRecommend addTarget:self action:@selector(chooserHotList:) forControlEvents:UIControlEventTouchDown];
    [_hotestRecommend setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:0];
   
    self.hotestRecommend=hotestRecommend;
    //----------------------------------------------------------//

    _bottomScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 355, 2*SCREEN_WIDTH, SCROLLVIEWHEIGH)];
    _bottomNewScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCROLLVIEWHEIGH)];
    _bottomHotScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCROLLVIEWHEIGH)];
    [_bottomScrollerView addSubview:_bottomNewScrollerView];
    [_bottomNewScrollerView addSubview:_bottomHotScrollerView];
    [self.view addSubview:_bottomScrollerView];
    
   
    for (NSInteger index=0; index<self.currentCoupons.count; index++) {
        NSDictionary* dic=self.currentCoupons[index];
        couponsView * couV=[[couponsView alloc]initWithFrame:CGRectMake(index*SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, SCROLLVIEWHEIGH)];
        [couV.button addTarget:self action:@selector(jumpTuActivity:) forControlEvents:UIControlEventTouchUpInside];
        [couV setDataWithDictionary:dic];
        ;
        [_bottomNewScrollerView addSubview:couV];

    }
    _bottomNewScrollerView.contentSize=CGSizeMake(SCREEN_WIDTH, 2*SCROLLVIEWHEIGH);
    _bottomNewScrollerView.bounces=NO;
    _bottomNewScrollerView.showsHorizontalScrollIndicator=NO;
    _bottomNewScrollerView.pagingEnabled=YES;
    [self.view addSubview:hotestRecommend];
    NSLog(@"%lu",self.state);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)chooserNewList:(UIButton*)sender{
    [sender setTitleColor:chooseColor forState:UIControlStateSelected];
     [_bottomScrollerView setContentOffset:CGPointMake(0, 0) animated:YES];
    self.state=isNewestStata;
    [self changeButtonColor];
}
-(void)chooserHotList:(UIButton*)sender{

     [_bottomScrollerView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
    self.state=isHotestState;
    [self changeButtonColor];

}
//button变色
-(void)changeButtonColor{
    switch (self.state) {
        case isDefaultStata:
            [self.newesetRecommend setTitleColor:chooseColor forState:0];
            [_newesetRecommend setBackgroundImage:[UIImage imageNamed:@"button .png"] forState:0];
            [self.hotestRecommend setTitleColor:[UIColor blackColor] forState:0];
            break;
        case isNewestStata:
            [self.newesetRecommend setTitleColor:chooseColor forState:0];
            [_newesetRecommend setBackgroundImage:[UIImage imageNamed:@"button .png"] forState:0];
            [self.hotestRecommend setTitleColor:[UIColor blackColor] forState:0];
            [_hotestRecommend setBackgroundImage:nil forState:0];
            break;
        case isHotestState:
            [self.newesetRecommend setTitleColor:[UIColor blackColor] forState:0];
            [_newesetRecommend setBackgroundImage:nil forState:0];
            [self.hotestRecommend setTitleColor:chooseColor forState:0];
            [_hotestRecommend  setBackgroundImage:[UIImage imageNamed:@"button .png"] forState:0];
            
        default:
            break;
    }

}
-(void)jumpTuActivity:(UIButton*)sender{

    ActivityDetailsViewController * ac=[[ActivityDetailsViewController alloc]initWithNibName:@"ActivityDetailsViewController" bundle:nil];
    [self.navigationController
     pushViewController:ac animated:YES];


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
