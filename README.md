# AlertTableView
使用UITableView封装类似于UIAlertView控件




![自定义UITableView.gif](http://upload-images.jianshu.io/upload_images/1658521-8c88886b88bfaf38.gif?imageMogr2/auto-orient/strip)



####使用方法：
- 1.直接将AlertViewTable拖入项目中，其次导入头文件"HHAlertTabViewController.h",进行初始化
- 2.初始化时将展现的内容通过数组传入即可。

```
- (void)viewDidLoad {
    [super viewDidLoad];
    __block NSString *text = nil;
     NSArray *arr= @[@"123",@"456",@"789",@"666",@"8888",@"333",@"花花同学"];
    
    HHAlertTabViewController *alert =[[HHAlertTabViewController alloc]
alertinitWithTitle:@"提示" dataSoreArr:arr setupAlertCellHandler:
^(AlertCell *cell, NSIndexPath *indexPath) {
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
  UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil 
                                                message:message
                                   delegate:nil cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    [alert show];
}

```
