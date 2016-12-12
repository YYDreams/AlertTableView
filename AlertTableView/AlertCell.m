//
//  AlertCell.m
//  Table
//
//  Created by 花花 on 16/10/1.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "AlertCell.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@implementation AlertCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commonInit];
    }
    return  self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    
    return self;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    
    return self;
    
}

- (instancetype)init{
    
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self commonInit];
   }
-(void)commonInit{
    [self.contentView addSubview: self.nameLabel];
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.btn_checked];

}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    CGFloat margin = 10;
    CGSize  LabelSize = [self.nameLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.nameLabel.font} context:nil].size;
    self.nameLabel.frame = CGRectMake(2*margin, margin, LabelSize.width, LabelSize.height);
    
    self.imgView.frame = CGRectMake(SCREEN_WIDTH-80, (self.bounds.size.height-25)/2, 25, 25);
    
    self.btn_checked.frame = CGRectMake(SCREEN_WIDTH-80, (self.bounds.size.height-25)/2, 25, 25);

}
-(UILabel *)nameLabel{


    if (!_nameLabel) {
        UILabel *nameLabel =[[UILabel alloc]init];
        nameLabel.textColor =[UIColor grayColor];
        nameLabel.font =[UIFont systemFontOfSize:15];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel = nameLabel;
    }
    return _nameLabel;

}
-(UIButton *)btn_checked{
    if (!_btn_checked) {
        UIButton *btn =[UIButton new];
        [btn setBackgroundImage:[UIImage imageNamed:@"choosed"] forState:UIControlStateNormal];
        if (self.is_selected == NO) {
            [btn setHidden:YES];
        }
        _btn_checked = btn;
        
    }

    return _btn_checked;
}
-(UIImageView *)imgView{

    if (!_imgView) {
        UIImageView *imgView =[[UIImageView alloc]init];
        imgView.image =[UIImage imageNamed:@"unChoosed"];
        _imgView = imgView;
    }

    return _imgView;
}
- (void)show_select{
    
    if (self.is_selected == NO) {
        [self.btn_checked setHidden:NO];
        [self bringSubviewToFront:self.btn_checked];
        self.is_selected = YES;
    }else{
        [self hide_select];
    }
}

- (void)hide_select{
    [self.btn_checked setHidden:YES];
    self.is_selected = NO;
}


@end
