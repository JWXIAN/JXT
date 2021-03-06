//
//  JsonPaser.h
//  jiaxiaotong
//
//  Created by 1039soft on 15/5/17.
//  Copyright (c) 2015年 1039soft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWProfileModel;
@class JWDriveBodyModel;
@class JWLoginModel;
@class JWDriveHeadModel;
@class JWRecordHeadModel;

@interface JsonPaser : NSObject

//解析学员信息
+(JWProfileModel *)parserUserInfoByDictionary:(NSDictionary *)dic;
//学员登陆
+(JWLoginModel *)parserStuLoginByDictionary:(NSDictionary *)dic;
//驾校
+(JWDriveHeadModel *)parserDriveInfoByDictionary:(NSDictionary *)dic;
////教练信息
//+(DriTeacherInfo *)parserDriTeacherInfoByDictionary:(NSDictionary *)dic;
////教练列表
//+(DriTeachersList *)parserDriTeaListByDictionary:(NSDictionary *)dic;
////学生考试进度
//+(ExamSchedule *)parserExamScheduleByDictionary:(NSDictionary *)dic;
//查询预约记录
+(JWRecordHeadModel *)parserBookRecordByDictionary:(NSDictionary *)dic;
////分享
//+(Share *)parserShareByDictionary:(NSDictionary *)dic;
////保存预约信息
//+(SaveBookRecord *)parserSaveBookRecordByDictionary:(NSDictionary *)dic;
////添加投诉
//+(AddComplaint *)parserAddComplaintByDictionary:(NSDictionary *)dic;
////学员投诉列表
//+(StuComplaintList *)parserStuComplaintListByDictionary:(NSDictionary *)dic;
////修改密码
//+(ChangePassword *)parserChangePasswordByDictionary:(NSDictionary *)dic;
////修改手机号
//+(ChangePhoneNum *)parserChangePhoneNumByDictionary:(NSDictionary *)dic;
////教练可约时段
//+(TeacherTime *)parserTeacherTimeByDictionary:(NSDictionary *)dic;
////教练可约日期
//+(TeacherPeriodDate *)parserTeacherPeriodDateByDictionary:(NSDictionary *)dic;
////对教练的评价
//+(TeacherAppraised *)parserTeacherAppraisedByDictionary:(NSDictionary *)dic;
////学员考试明细
//+(StudentExamContent *)parserStudentExamContentByDictionary:(NSDictionary *)dic;
////官方公告
//+(OfficialAnnounce *)parserOfficialAnnounceByDictionary:(NSDictionary *)dic;
////联动时段列表
//+(DynamicPeriodList *)parserDynamicPeriodListByDictionary:(NSDictionary *)dic;




@end
