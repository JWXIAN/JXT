//
//  JWProfileTVController.m
//  JXT
//
//  Created by JWX on 15/6/22.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWProfileTVController.h"
#import "JWProfileTVCell.h"

@interface JWProfileTVController ()

@end

@implementation JWProfileTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
    
//    self.tableView.rowHeight = 80;
    
    // 调整边距，可以让表格视图让开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    // footerView
    // footerView的宽度会和表格整体宽度一致，只需要指定高度即可
    //    self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    //    view.backgroundColor = [UIColor redColor];
    //    self.tableView.tableFooterView = view;
    // 从XIB加载最后一个视图设置为footerView
    // 视图控制器成为footerView的代理
    
    self.tableView.tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"JWProfileTVCell" owner:nil options:nil] lastObject];
}

- (void)setting
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 1. 创建cell
//    HMTgCell *cell = [HMTgCell cellWithTableView:tableView];
//    
//    // 2. 通过数据模型，设置Cell内容，可以让视图控制器不需要了解cell内部的实现细节
//    cell.tg = self.tgs[indexPath.row];
//    
//    return cell;
//}

@end
