//
//  HHAlertTabViewController.h
//  AlertTableView
//
//  Created by 花花 on 2016/12/6.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "ViewController.h"

#import "AlertCell.h"
typedef void(^HHsetupAlertCellHandler)(AlertCell *cell,NSIndexPath *indexPath);
//取消按钮点击事件
typedef void(^cancelOnOnlick)(UIButton *cancenbtn);

//确定按钮点击事件
typedef void(^finishOnClick)(UIButton *finishbtn);

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface HHAlertTabViewController : UIViewController
@property(nonatomic, strong,readonly) NSArray *dataArr;
@property(nonatomic, strong,readonly) UITableView *tableView;
@property(nonatomic, strong,readonly) UILabel *labeltitle;
@property(nonatomic, strong,readonly) AlertCell *cell;


-(instancetype)alertinitWithTitle:(NSString *)title
                         dataSoreArr:(NSArray<NSString *>*)dataArr
                   setupAlertCellHandler:(HHsetupAlertCellHandler)alertCellHandler
                   cancelOnOnlick:(cancelOnOnlick)cancelbtn
                     finishOnClick:(finishOnClick)finishbtn;

@end
