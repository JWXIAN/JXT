//
//  JWSettingTVCell.m
//  JXT
//
//  Created by JWX on 15/6/23.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWSettingTVCell.h"

@implementation JWSettingTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithObjects:@"分享给朋友", @"意见反馈", @"选择驾校", @"修改密码", @"帮助", @"关于我们", nil];
    }
    return _dataList;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置表格
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
}
@end
