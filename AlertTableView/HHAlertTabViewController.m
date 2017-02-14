//
//  HHAlertTabViewController.m
//  AlertTableView
//
//  Created by 花花 on 2016/12/6.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "HHAlertTabViewController.h"

#import "AlertCell.h"
@interface HHAlertTabViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSArray *dataArr;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UILabel *labeltitle;

@property(nonatomic, copy) cancelOnOnlick cancelbtn;

@property(nonatomic, copy) HHsetupAlertCellHandler alertCellHandler;

@property(nonatomic, copy) finishOnClick finishbtn;


@end

static NSString *const cellID = @"cellID";
static NSInteger const headerHeight = 40;
static NSInteger const footerHeight = 50;
static NSInteger const rowHeight = 44;
@implementation HHAlertTabViewController

#pragma mark - init
-(instancetype)alertinitWithTitle:(NSString *)title
                      dataSoreArr:(NSArray<NSString *>*)dataArr
            setupAlertCellHandler:(HHsetupAlertCellHandler)alertCellHandler
                   cancelOnOnlick:(cancelOnOnlick)cancelbtn
                    finishOnClick:(finishOnClick)finishbtn{
    
    
    if (self == [super initWithNibName:nil bundle:nil ]) {
        _cancelbtn = [cancelbtn copy];
        _finishbtn =[finishbtn copy];
        self.labeltitle.text = title;
        _alertCellHandler =[alertCellHandler copy];
        self.dataArr = dataArr;
        
        [self.view addSubview:self.tableView];
        [self.tableView registerClass:[AlertCell class] forCellReuseIdentifier:cellID];
        
    }
    return self;
    
}
#pragma mark - SEL Methods
-(void)cancelOnClick:(UIButton *)btn{
    
    if (self.cancelbtn) {
        self.cancelbtn(btn);
    }
}

-(void)finishOnClick:(UIButton *)btn{
    
    if (self.finishbtn) {
        self.finishbtn(btn);
    }
}

#pragma mark - <<UITableViewDataSource,UITableViewDelegate>>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlertCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[AlertCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.nameLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AlertCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell.is_selected) {
        
        //如果选择的cellis_selected为no，显示btn，隐藏其他cell的btn
        for (int i = 0; i < self.dataArr.count; i++) {
            
            AlertCell *c = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            
            if (![cell isEqual:c]) {//把未选中的cell的btn隐藏
                
                [c hide_select];
                
            }else{//展示选中的cell的btn
                [cell show_select];
                
            }
            
        }
    }
    
    if (self.alertCellHandler) {
        self.alertCellHandler(cell,indexPath);
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.labeltitle;
}



-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return headerHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return footerHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *allbtnsView =[[UIView alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(self.self.labeltitle.frame) , self.view.frame.size.width-20, 50)];
    
    allbtnsView.backgroundColor =[UIColor orangeColor];
    UIButton *cancelbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, allbtnsView.frame.size.width/2, 50)];
    [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelbtn.layer.borderColor=[UIColor grayColor].CGColor;
    cancelbtn.layer.borderWidth=0.5;
    [cancelbtn addTarget:self action:@selector(cancelOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *finishbtn =[[UIButton alloc]initWithFrame:CGRectMake(allbtnsView.frame.size.width/2,0, allbtnsView.frame.size.width/2, 50)];
    finishbtn.layer.borderColor=[UIColor grayColor].CGColor;
    finishbtn.layer.borderWidth=0.5;
    [finishbtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishbtn addTarget:self action:@selector(finishOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [allbtnsView addSubview:cancelbtn];
    [allbtnsView addSubview:finishbtn];
    
    return allbtnsView;
    
}


#pragma mark - Setter && Getter
-(UITableView * )tableView{
    
    if (!_tableView) {
        
        CGFloat margin  = 10;
        
        self.tableView =  [[UITableView alloc]initWithFrame:CGRectMake(2 *margin, 0,self.view.bounds.size.width-4*margin ,headerHeight+rowHeight*self.dataArr.count+footerHeight) style:UITableViewStylePlain];
        self.tableView.center = self.view.center;
        self.tableView.backgroundColor =[UIColor redColor];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.layer.masksToBounds = YES;
        self.tableView.layer.cornerRadius = 5;
        self.tableView.bounces = NO;
        
    }
    return _tableView;
}

- (UILabel *)labeltitle{
    
    if (!_labeltitle) {
        _labeltitle =[UILabel new];
        _labeltitle.textAlignment = NSTextAlignmentCenter;
        
        
    }
    
    return _labeltitle;
    
    
}

@end
