//
//  AlertCell.h
//  Table
//
//  Created by 花花 on 16/10/1.
//  Copyright © 2016年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertCell : UITableViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UIButton *btn_checked;
@property(nonatomic, assign) BOOL is_selected;
@property(nonatomic, strong) UIImageView *imgView;

- (void)show_select;

- (void)hide_select;
@end
