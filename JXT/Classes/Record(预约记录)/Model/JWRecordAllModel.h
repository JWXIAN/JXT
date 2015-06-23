//
//  JWRecordAllModel.h
//  JXT
//
//  Created by JWX on 15/6/23.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWRecordAllModel : NSObject

@property (nonatomic,copy)NSString *issuccess;                     //是否成功
@property (nonatomic,copy)NSString *statecode;                  // 状态码 ???
@property (nonatomic,copy)NSString *stateinfo;                  //  状态信息 ???

@property (nonatomic,copy)NSString *per_name;       //学员姓名
@property (nonatomic,copy)NSString *stuID;          //学员ID
@property (nonatomic,copy)NSString *ddate;          //预约日期
@property (nonatomic,copy)NSString *period;         //学时
@property (nonatomic,copy)NSString *t_info;         //预约时断
@property (nonatomic,copy)NSString *type;           //驾照类型
@property (nonatomic,copy)NSString *yyfs;           //预约方式
@property (nonatomic,copy)NSString *carcode;        //教练车编号
@property (nonatomic,copy)NSString *teacher;        //教练姓名
@property (nonatomic,copy)NSString *status;         //状态
@property (nonatomic,copy)NSString *tuiyuetime;     //退约时间
@property (nonatomic,copy)NSString *t_yn;           //???
@property (nonatomic,copy)NSString *jspy;           //???
@property (nonatomic,copy)NSString *pjzt;           //评价状态

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)recordAllWithDict:(NSDictionary *)dict;

+ (NSArray *)recordAlls;

@end
