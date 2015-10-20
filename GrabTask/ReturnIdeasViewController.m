//
//  ReturnIdeasViewController.m
//  KKMyView
//
//  Created by apple on 15/10/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReturnIdeasViewController.h"

@interface ReturnIdeasViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic,strong)UILabel * placeholderLabel;//textView 的 placeholder
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ReturnIdeasViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"意见反馈";
    self.textView.delegate=self;
    self.button.userInteractionEnabled=NO;
    
    //模仿UTextField的placeholder属性
    _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.textView.frame), 20)];
    _placeholderLabel.backgroundColor = [UIColor clearColor];
    _placeholderLabel.textColor = [UIColor grayColor];
    _placeholderLabel.text = @"请输入内容";
    _placeholderLabel.font = self.textView.font;
    [self.textView addSubview:_placeholderLabel];
    
    
    
    
}
/*
 **监听点击事件，当点击非textfiled位置的时候，所有输入法全部收缩
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
//TextView的方法：
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
        return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
        return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    _placeholderLabel.text = @"";
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    //模仿UTextField的placeholder属性
    if (self.textView.text.length == 0) {
        _placeholderLabel.text = @"请输入内容";
    }else{
        _placeholderLabel.text = @"";
        //将button按钮点亮
        self.button.alpha=1.0;
        self.button.userInteractionEnabled=YES;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"将要改变内容？");
    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"改变内容。");
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"选中内容。");
}

- (IBAction)textField:(UITextField *)sender {
}



- (IBAction)btnClick:(UIButton *)sender {
    NSLog(@"花花");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
