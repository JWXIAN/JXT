//
//  JWProfileTVCell.m
//  JXT
//
//  Created by JWX on 15/6/19.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWProfileTVCell.h"
#import "JsonPaser.h"
#import "JiaxiaotongAPI.h"
#import "UIImageView+WebCache.h"

@implementation JWProfileTVCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
//    // 1. 可重用标示符
//    static NSString *ID = @"Cell";
//    // 2. tableView查询可重用Cell
//    JWProfileTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    // 3. 如果没有可重用cell
//    if (cell == nil) {
//        NSLog(@"加载XIB");
//        // 从XIB加载自定义视图
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"JWProfileTVCell" owner:nil options:nil] lastObject];
//        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//    }
//    return cell;
    return 0;
}

- (void)setUserInfo:(JWProfileModel *)userInfo
{
    // setter方法中，第一句要赋值，否则要在其他方法中使用模型，将无法访问到
//     _userInfo = userInfo;
//    self.imagePerson.image = [UIImage im];
//    self.lableName.text = userInfo.per_name;
//    self.lableNo.text = userInfo.train_learnid;
//    self.lableText.text = userInfo.out_bushi;
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *uid = [ud objectForKey:@"per_idcardno"];
//    [JiaxiaotongAPI requestUserInfoByUserID:uid andCallback:^(id obj) {
//        JWProfileModel *userInfo =  (JWProfileModel *)obj;
//        self.lableName.text = userInfo.per_name;
//        self.lableNo.text = userInfo.train_learnid;
//        self.con.image = [UIImage imageNamed:@"tabbar_compose_button_highlighted"];
//        
//        
//    }];
}

#pragma mark - 模板提供的方法
/**
 初始化方法
 
 使用代码创建Cell的时候会被调用，如果使用XIB或者Storyboard，此方法不会被调用
 */
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        NSLog(@"%s", __func__);
//    }
//    return self;
//}

/**
 从XIB被加载之后，会自动被调用，如果使用纯代码，不会被执行
 */
//- (void)awakeFromNib {
//    // Initialization code
//}

/**
 Cell 被选中或者取消选中是都会被调用
 
 如果是自定义Cell控件，所有的子控件都应该添加到contentView中
 */
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//    
//    if (selected) {
//        self.contentView.backgroundColor = [UIColor redColor];
//    } else {
//        self.contentView.backgroundColor = [UIColor greenColor];
//    }
//}

@end
