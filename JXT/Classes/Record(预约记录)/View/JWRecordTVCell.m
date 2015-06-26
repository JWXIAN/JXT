//
//  JWRecordTVCell.m
//  JXT
//
//  Created by JWX on 15/6/23.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWRecordTVCell.h"
#import "JWRecordHeadModel.h"
#import "JWRecordBodyModel.h"

@implementation JWRecordTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //预约日期
    self.lbData.text = self.stuBookRecordInfo.ddate;
    //预约者
    self.lbName.text = self.stuBookRecordInfo.per_name;
    //预约时段
    self.lbHour.text = self.stuBookRecordInfo.t_info;
    //预约方式
    self.lbMode.text = self.stuBookRecordInfo.yyfs;
    //预约状态
    self.lbState.text = self.stuBookRecordInfo.status;
    //预约类型
    self.lbType.text = self.stuBookRecordInfo.type;
    //预约车号
    self.lbCarNo.text = self.stuBookRecordInfo.carcode;
    
}
@end
