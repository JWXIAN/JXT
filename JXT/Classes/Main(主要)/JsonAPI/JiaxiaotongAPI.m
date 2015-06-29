
//
//  JiaxiaotongAPI.m
//  jiaxiaotong
//
//  Created by 1039soft on 15/5/17.
//  Copyright (c) 2015年 1039soft. All rights reserved.
//

#import "JiaxiaotongAPI.h"
#import "AFNetworking.h"
#import "JsonPaser.h"
#import "JWDriveBodyModel.h"
#import "MBProgressHUD+MJ.h"
#import "JWLoginModel.h"
#import "JWDriveHeadModel.h"
#import "JWRecordHeadModel.h"


@implementation JiaxiaotongAPI


//+(NSString *)getToken{
//    return [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//}

//学员信息
+(void)requestUserInfoByUserID:(NSString *)userID andCallback:(MyCallback)callback{
//    
//    NSString *str = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx";
   
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryStudentInfo&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>00012</schoolId><accountId>130104198810121215</accountId><methodName>queryStudentInfo</methodName></MAP_TO_XML>";
    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryStudentInfo&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>12345</schoolId><accountId>130104198810121215</accountId><methodName>queryStudentInfo</methodName></MAP_TO_XML>";
   
    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
   
    NSArray *fristArray =[path componentsSeparatedByString:@"methodName="];
    NSString *secondStr = (NSString *)fristArray[0];
    NSArray *secondArray = [secondStr componentsSeparatedByString:@"&"];
    NSString *name = (NSString *)secondArray[0];
    
   // NSString *path =  @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryStudentInfo&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E12345%3C/schoolId%3E%3CaccountId%3E130104198810121215%3C/accountId%3E%3CmethodName%3EqueryStudentInfo%3C/methodName%3E%3C/MAP_TO_XML%3E";
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manger GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        JWProfileModel *userInfo = [JsonPaser parserUserInfoByDictionary:dic];
        callback(userInfo);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}
//驾校列表
+(void)requestDriveByDriveID:(NSString *)driveID andCallback:(MyCallback)callback{
    //NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=getSchoolList&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CpageN%3E11%3C/pageN%3E%3CpageNum%3E0%3C/pageNum%3E%3CjxName%3E%3C/jxName%3E%3Csheng%3E%3C/sheng%3E%3Cshiqu%3E%3C/shiqu%3E%3C/MAP_TO_XML%3E%27%20";
    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=getSchoolList&xmlStr=<\?xml version=\"1.0\" encoding=\"utf-8\"\?><MAP_TO_XML><pageN>11</pageN><pageNum>0</pageNum><jxName></jxName><sheng></sheng><shiqu></shiqu></MAP_TO_XML>";
    
    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        [MBProgressHUD showMessage:@"正在加载驾校信息..."];
        if (dic != nil) {
            JWDriveHeadModel *drive = [JsonPaser parserDriveInfoByDictionary:dic];
            callback(drive);
            [MBProgressHUD hideHUD];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
////教练信息
//+(void)requsetDriTeacherInfoByDriTeaInfo:(NSString *)driTeacherInfo andCallback:(MyCallback)callback{
//   // NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=QueryTeacherInfo&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E12345%3C/schoolId%3E%3Ccarid%3E1001%3C/carid%3E%3Cstuid%3E0110110547%3C/stuid%3E%3CmethodName%3EQueryTeacherInfo%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=QueryTeacherInfo&xmlStr=<\?xml version=\"1.0\" encoding=\"utf-8\"\?><MAP_TO_XML><schoolId>00012</schoolId><carid>1001</carid><stuid>0110110547</stuid><methodName>QueryTeacherInfo</methodName></MAP_TO_XML>";
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        DriTeacherInfo *driTeacherInfo = [JsonPaser parserDriTeacherInfoByDictionary:dic];
//        callback(driTeacherInfo);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发送请求教练信息失败");
//    }];
//}
////教练列表
//+(void)requestDriTeacherListByDriTeacherList:(NSString *)driTeacherList andCallback:(MyCallback)callback{
//   // NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTeacherList&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CpageN%3E0%3C/pageN%3E%3CpageNum%3E0%3C/pageNum%3E%3CschoolId%3E12345%3C/schoolId%3E%3CaccountId%3E0114080078%3C/accountId%3E%3CJLname%3E%E6%88%91%E7%9A%84%E6%95%99%E7%BB%83%3C/JLname%3E%3CmethodName%3EqueryTeacherList%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *accountID =[ud objectForKey:@"accountID"];
//    NSString *schoolID = [ud objectForKey:@"drivecode"];
//    NSString *teacherName = [ud objectForKey:@"teacherName"];
//    
//    NSString *path = [NSString stringWithFormat:@"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTeacherList&xmlStr=<\?xml version=\"1.0\" encoding=\"utf-8\"\?><MAP_TO_XML><pageN>0</pageN><pageNum>0</pageNum><schoolId>%@</schoolId><accountId>%@</accountId><JLname>%@</JLname><methodName>queryTeacherList</methodName></MAP_TO_XML>",schoolID,accountID,teacherName];
//    
//   
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        DriTeachersList *driTeacherList = [JsonPaser parserDriTeaListByDictionary:dic];
//        
//        callback(driTeacherList);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         NSLog(@"发送请求教练列表失败");
//    }];
//    
//}
//学员登陆
+(void)requsetStuLoginByStuLogin:(NSString *)stuLogin andCallback:(MyCallback)callback{
 
  
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *accountID =[ud objectForKey:@"accountID"];
    NSString *password = [ud objectForKey:@"password"];
    NSString *schoolID = [ud objectForKey:@"drivecode"];
    NSString *path = [NSString stringWithFormat:@"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=studentLogin&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>%@</schoolId><accountId>%@</accountId><passWord>%@</passWord><methodName>studentLogin</methodName></MAP_TO_XML>",schoolID,accountID,password];
    
    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
    
    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        JWLoginModel *stuLogin = [JsonPaser parserStuLoginByDictionary:dic];
        callback(stuLogin);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送请求教练信息失败");
    }];
}

////学员考试进度
//+(void)requestStuExamScheduleByStuExamSchedule:(NSString *)stuExamSchedule andCallback:(MyCallback)callback{
//
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryExa_KaoShi_JinDu&SCHOOL_ID=00012&stu_id=0114120002";
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        ExamSchedule *examSchedule = [JsonPaser parserExamScheduleByDictionary:dic];
//        callback(examSchedule);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发送请求学员考试进度失败");
//    }];
//}
//查询预约记录
+(void)requestBookRecordByBookRecord:(NSString *)bookRecord andCallback:(MyCallback)callback{
   // NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryYuyue&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CpageN%3E3%3C/pageN%3E%3CpageNum%3E0%3C/pageNum%3E%3CschoolId%3E49267%3C/schoolId%3E%3ClearnID%3E0114040503%3C/learnID%3E%3Cstatus%3E%E9%A2%84%E7%BA%A6%3C/status%3E%3CmethodName%3EqueryYuyue%3C/methodName%3E%3C/MAP_TO_XML%3E";
    
    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryYuyue&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><pageN>3</pageN><pageNum>0</pageNum><schoolId>49267</schoolId><learnID>0114040503</learnID><status>预约</status><methodName>queryYuyue</methodName></MAP_TO_XML>";
    
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
<<<<<<< HEAD
//        JWLog(@"%@",dic);
=======
>>>>>>> origin/master
        JWRecordHeadModel *bookRecord = [JsonPaser parserBookRecordByDictionary:dic];
        callback(bookRecord);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送请求查询预约记录失败");
    }];

}
////分享
//+(void)requestShareByShare:(NSString *)share andCallback:(MyCallback)callback{
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=querySharecontent";
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        Share *share = [JsonPaser parserShareByDictionary:dic];
//        callback(share);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发送分享请求失败");
//    }];
//}
//
////保存预约信息
//+(void)requestSaveBookRecordBySaveBookRecord:(NSString *)saveBookRecord andCallback:(MyCallback)callback{
//   // NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=SaveYueInfo&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E12345%3C/schoolId%3E%3Cyue_ddate%3E2014-12-27,2014-12-27%3C/yue_ddate%3E%3Cyue_t%3E08:00-09:00,09:00-10:00%3C/yue_t%3E%3Cyue_car%3E053%3C/yue_car%3E%3Cyue_learnno%3E915887%3C/yue_learnno%3E%3Cyue_type%3EPXLX002%3C/yue_type%3E%3Cyue_today%3E2014-12-26%3C/yue_today%3E%3Cordercode%3EORDW2014122600028%3C/ordercode%3E%3Cremark%3Eapp%E7%BA%A6%E8%BD%A6%3C/remark%3E%3Cteacher%3E%E7%99%BD%E6%99%B6%3C/teacher%3E%3CtearcharID%3E1026%3C/tearcharID%3E%3CmethodName%3ESaveYueInfo%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=SaveYueInfo&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>12345</schoolId><yue_ddate>2014-12-27,2014-12-27</yue_ddate><yue_t>08:00-09:00,09:00-10:00</yue_t><yue_car>053</yue_car><yue_learnno>915887</yue_learnno><yue_type>PXLX002</yue_type><yue_today>2014-12-26</yue_today><ordercode>ORDW2014122600028</ordercode><remark>app约车</remark><teacher>白晶</teacher><tearcharID>1026</tearcharID><methodName>SaveYueInfo</methodName></MAP_TO_XML>";
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        SaveBookRecord *saveBookRecord = [JsonPaser parserSaveBookRecordByDictionary:dic];
//        callback(saveBookRecord);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"发送保存预约信息失败!");
//    }];
//    
//}
////添加投诉
//+(void)requestAddComplaintByAddComplaint:(NSString *)addComplaint andCallback:(MyCallback)callback{
//  //  NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=insertTousu&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E12345%3C/schoolId%3E%3Copername%3E%E5%BC%A0%E4%B8%89%3C/opername%3E%3Coperid%3E0107030001%3C/operid%3E%3Ctjtype%3E%E6%8A%95%E8%AF%89%3C/tjtype%3E%3Czhuti%3E%E6%95%99%E7%BB%83%E6%94%B6%E7%BA%A2%E5%8C%85%3C/zhuti%3E%3Ctjcontent%3E%E6%94%B6%E7%BA%A2%E5%8C%85%E7%9A%84%E6%95%99%E7%BB%83%E6%98%AF%E6%9D%8E%E5%9B%9B%EF%BC%8C%E6%80%81%E5%BA%A6%E8%9B%AE%E6%A8%AA%3C/tjcontent%3E%3CmethodName%3EinsertTousu%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=insertTousu&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>12345</schoolId><opername>张三</opername><operid>0107030001</operid><tjtype>投诉</tjtype><zhuti>教练收红包</zhuti><tjcontent>收红包的教练是李四，态度蛮横</tjcontent><methodName>insertTousu</methodName></MAP_TO_XML>";
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        AddComplaint *complaint = [JsonPaser parserAddComplaintByDictionary:dic];
//        callback(complaint);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发送添加投诉失败!");
//    }];
//}
////投诉列表
//+(void)requestComplaintListByComplaintList:(NSString *)complaintlist andCallback:(MyCallback)callback{
// //   NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTousu&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CpageN%3E4%3C/pageN%3E%3CpageNum%3E0%3C/pageNum%3E%3CschoolId%3E12345%3C/schoolId%3E%3Cstuid%3E0107030001%3C/stuid%3E%3CmethodName%3EqueryTousu%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTousu&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><pageN>4</pageN><pageNum>0</pageNum><schoolId>12345</schoolId><stuid>0107030001</stuid><methodName>queryTousu</methodName></MAP_TO_XML>";
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        StuComplaintList *complaintList = [JsonPaser parserStuComplaintListByDictionary:dic];
//        callback(complaintList);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//          NSLog(@"发送投诉列表失败!");
//    }];
//}
////教练可约时段
//+(void)requestTeacherTimeByTeacherTime:(NSString *)teacherTime andCallback:(MyCallback)callback{
//   // NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTeacherPeriodList&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E12345%3C/schoolId%3E%3Ccarid%3E1111%3C/carid%3E%3Cstuid%3E123456%3C/stuid%3E%3CpageN%3E0%3C/pageN%3E%3CpageNum%3E0%3C/pageNum%3E%3CsqlWhere%3E%3C/sqlWhere%3E%3CmethodName%3EQueryYueCarList%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTeacherPeriodList&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>12345</schoolId><carid>1111</carid><stuid>123456</stuid><pageN>0</pageN><pageNum>0</pageNum><sqlWhere></sqlWhere><methodName>QueryYueCarList</methodName></MAP_TO_XML>";
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        TeacherTime *teacherTime = [JsonPaser parserTeacherTimeByDictionary:dic];
//        callback(teacherTime);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"发送请求教练可约时段失败!");
//    }];
//    }
//
////教练可约日期
//+(void)requestTeacherPeriodDateByComplaintList:(NSString *)teacherPeriodDate andCallback:(MyCallback)callback{
//    //NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTeacherDateList&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E12345%3C/schoolId%3E%3Ccarid%3E1111%3C/carid%3E%3Cstuid%3E123456%3C/stuid%3E%3CmethodName%3EqueryTeacherDateList%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryTeacherDateList&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>12345</schoolId><carid>1111</carid><stuid>123456</stuid><methodName>queryTeacherDateList</methodName></MAP_TO_XML>";
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        TeacherPeriodDate *teacherPeriodDate = [JsonPaser parserTeacherPeriodDateByDictionary:dic];
//        callback(teacherPeriodDate);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发送请求教练可约日期失败!");
//    }];
//}
//
////学员考试明细
//+(void)requsetStudentExamContentByStudentExamContent:(NSString *)studentExamContent andCallback:(MyCallback)callback{
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryExa_RecordList&SCHOOL_ID=00012&stu_id=0107030001";
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        StudentExamContent *studentExamContent = [JsonPaser parserStudentExamContentByDictionary:dic];
//        callback(studentExamContent);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发送请求学员考试明细失败!");
//    }];
//}
//
////官方公告
//+(void)requestOfficialAnnounceByOfficialAnnounce:(NSString *)officialAnnounce andCallback:(MyCallback)callback{
//   // NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryAttention&xmlStr=%3C?xml%20version=%221.0%22%20encoding=%22utf-8%22%20?%3E%3CMAP_TO_XML%3E%3CschoolId%3E49267%3C/schoolId%3E%3CmethodName%3EqueryAttention%3C/methodName%3E%3C/MAP_TO_XML%3E";
//    
//    NSString *path = @"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryAttention&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>49267</schoolId><methodName>queryAttention</methodName></MAP_TO_XML>";
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        OfficialAnnounce *officialAnnounce = [JsonPaser parserOfficialAnnounceByDictionary:dic];
//        callback(officialAnnounce);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         NSLog(@"发送请求官方公告失败!");
//    }];
//}
//
////修改密码
//+(void)requestChangedPasswordByChangedPassword:(NSString *)changedEPassword andCallback:(MyCallback)callback{
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *accountID =[ud objectForKey:@"accountID"];
//    NSString *password = [ud objectForKey:@"password"];
//    NSString *schoolID = [ud objectForKey:@"drivecode"];
//    NSString *newPassword = [ud objectForKey:@"currentPassword"];
//    
//    NSString *path = [NSString stringWithFormat:@"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=updateMima&xmlStr=<?xml version=\"1.0\" encoding=\"utf-8\" ?><MAP_TO_XML><schoolId>%@</schoolId><accountId>%@</accountId><oldpassWord>%@</oldpassWord><newpassWord>%@</newpassWord><methodName>updateMima</methodName></MAP_TO_XML>",schoolID,accountID,password,newPassword];
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        ChangePassword *changePassword = [JsonPaser parserChangePasswordByDictionary:dic];
//        callback(changePassword);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"请求修改密码失败!");
//        
//    }];
//}
////修改手机号码
//+(void)requsetChangedPhoneNumByChangedPhoneNum:(NSString *)changePhoneNum andCallback:(MyCallback)callback{
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *accountID =[ud objectForKey:@"accountID"];
//    NSString *schoolID = [ud objectForKey:@"drivecode"];
//    
//    NSString *oldmobile = [ud objectForKey:@"oldmobile"];
//    NSString *newmobile = [ud objectForKey:@"newmobile"];
//    
//    NSString *path = [NSString stringWithFormat:@"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=updateMobile&schoolId=%@&accountId=%@&oldmobile=%@&newmobile=%@",schoolID,accountID,oldmobile,newmobile];
//    
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    path =[path stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
//    path =[path stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    path =[path stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"];
//    path =[path stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        ChangePhoneNum *changePhoneNum = [JsonPaser parserChangePhoneNumByDictionary:dic];
//        callback(changePhoneNum);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"请求修改手机号码失败!");
//    }];
//    
//
//}
////获取联动时段列表
//+(void)requestDynamicPeriodListByDynamicPeriodList:(NSString *)dynamicPeriodList andCallback:(MyCallback)callback{
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *schoolID = [ud objectForKey:@"drivecode"];
//    NSString *path = [NSString stringWithFormat:@"http://xy.1039.net:12345/drivingServcie/rest/driving_json/Default.ashx?methodName=queryLianDongList&SCHOOL_ID=%@&shiduan=08:00-09:00",schoolID];
//     path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        DynamicPeriodList * dynamicPeriodList = [JsonPaser parserDynamicPeriodListByDictionary:dic];
//        callback(dynamicPeriodList);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"请求联动时段列表失败!");
//    }];
//    
//}






@end
