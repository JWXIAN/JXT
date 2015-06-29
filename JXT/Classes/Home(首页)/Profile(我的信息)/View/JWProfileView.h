//
//  JWProfileView.h
//  JXT
//
//  Created by JWX on 15/6/28.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWProfileView : UITableViewController
/**顶部头像*/
@property (strong, nonatomic) IBOutlet UITableViewCell *headCell;
/**身份证号*/
@property (strong, nonatomic) IBOutlet UITableViewCell *noCell;
/**报名日期*/
@property (strong, nonatomic) IBOutlet UITableViewCell *dataCell;
/**总学时*/
@property (strong, nonatomic) IBOutlet UITableViewCell *allCell;
/**已学学时*/
@property (strong, nonatomic) IBOutlet UITableViewCell *endCell;
/**剩余学时*/
@property (strong, nonatomic) IBOutlet UITableViewCell *syCell;
/**考试进度*/
@property (strong, nonatomic) IBOutlet UITableViewCell *kjCell;

/**顶部姓名*/
@property (weak, nonatomic) IBOutlet UILabel *lbName;
/**顶部学号*/
@property (weak, nonatomic) IBOutlet UILabel *lbNo;
/**身份证号*/
@property (weak, nonatomic) IBOutlet UILabel *lbcard;
/**报名日期*/
@property (weak, nonatomic) IBOutlet UILabel *lbData;
/**总学时*/
@property (weak, nonatomic) IBOutlet UILabel *lbAllHour;
/**已学学时*/
@property (weak, nonatomic) IBOutlet UILabel *lbEndHour;
/**剩余学时*/
@property (weak, nonatomic) IBOutlet UILabel *lbResidue;
/**考试进度*/
@property (weak, nonatomic) IBOutlet UILabel *lbExam;
@end
