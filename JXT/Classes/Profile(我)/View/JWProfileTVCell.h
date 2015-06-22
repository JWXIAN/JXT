//
//  JWProfileTVCell.h
//  JXT
//
//  Created by JWX on 15/6/19.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWProfileModel;

@interface JWProfileTVCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lableName;

@property (weak, nonatomic) IBOutlet UILabel *lableNo;


//用户信息 数据模型
@property (nonatomic,strong)JWProfileModel *userInfo;

/** 提供一个类方法，可以快速创建 Cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
