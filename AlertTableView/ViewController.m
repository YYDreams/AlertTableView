//
//  ViewController.m
//  AlertTableView
//
//  Created by 花花 on 2016/12/6.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "ViewController.h"
#import "HHAlertTabViewController.h"

@interface ViewController ()
@property(nonatomic, weak) HHAlertTabViewController *alertTableView;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor =[UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor =[UIColor yellowColor];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
#pragma mark - SEL Method
-(void)btnOnClick{

    __block NSString *text = nil;
    
     NSArray *arr= @[@"123",@"456",@"789",@"666",@"8888",@"333",@"花花同学"];
    
    HHAlertTabViewController *alert =[[HHAlertTabViewController alloc]alertinitWithTitle:@"提示" dataSoreArr:arr setupAlertCellHandler:^(AlertCell *cell, NSIndexPath *indexPath) {
        
        text = cell.nameLabel.text;
        
        NSLog(@"%@",cell.nameLabel.text);
    } cancelOnOnlick:^(UIButton *cancenbtn) {
        
        if(text==nil){
            [self message:@"请选择其中一项"];
            return ;
        }

        [self message:[NSString stringWithFormat:@"取消--%@",text]];
        
    } finishOnClick:^(UIButton *finishbtn) {
        
        if(text==nil){
            [self message:@"请选择其中一项"];
            return ;
        }
    [self message:[NSString stringWithFormat:@"完成--%@",text]];
    }];
    
    [self.view addSubview: alert.view];
    [self addChildViewController:alert];
}

-(void)message:(NSString *)message{

    UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];

}
@end
