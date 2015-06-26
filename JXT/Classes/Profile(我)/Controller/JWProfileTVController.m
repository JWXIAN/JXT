//
//  JWProfileTVController.m
//  JXT
//
//  Created by JWX on 15/6/22.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWProfileTVController.h"
#import "JWProfileTVCell.h"
#import "UIImageView+WebCache.h"

@interface JWProfileTVController ()
@property (nonatomic, strong) NSArray *setTitle;
@end

@implementation JWProfileTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
    
    self.tableView.rowHeight = 50;
    
//    // 调整边距，可以让表格视图让开状态栏
//    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
//    self.tableView = [[[NSBundle mainBundle] loadNibNamed:@"JWProfileTVCell" owner:nil options:nil] lastObject];
//    [self.tableView reloadData];
}

- (void)setting
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源代理方法

/**cell数据*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"设置页面-%ld", indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        // 第0个分组
        return 3;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

@end

