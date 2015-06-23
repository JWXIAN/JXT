//
//  JWRecordTVCell.h
//  JXT
//
//  Created by JWX on 15/6/23.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWRecordAllModel;

@interface JWRecordTVCell : UITableViewCell

/**预约日期*/
@property (weak, nonatomic) IBOutlet UILabel *lbData;
/**预约时段*/
@property (weak, nonatomic) IBOutlet UILabel *lbHour;
/**预约者*/
@property (weak, nonatomic) IBOutlet UILabel *lbName;
/**预约车号*/
@property (weak, nonatomic) IBOutlet UILabel *lbCarNo;
/**预约类型*/
@property (weak, nonatomic) IBOutlet UILabel *lbType;
/**预约方式*/
@property (weak, nonatomic) IBOutlet UILabel *lbMode;
/**预约状态*/
@property (weak, nonatomic) IBOutlet UILabel *lbState;

/** 预约信息的数据模型 */
@property (nonatomic, strong) JWRecordAllModel *ram;

/** 提供一个类方法，可以快速创建 Cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
