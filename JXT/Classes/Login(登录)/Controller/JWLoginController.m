//
//  JWLoginController.m
//  JXT
//
//  Created by JWX on 15/6/24.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWLoginController.h"
#import "PrefixHeader.pch"
#import "JWDLTVController.h"
#import "MBProgressHUD+MJ.h"
#import "JWTarBarController.h"
#import "JWLoginModel.h"
#import "JiaxiaotongAPI.h"
#import "JWNoticeTVController.h"

@interface JWLoginController ()<UITextFieldDelegate>

/**驾校列表*/
- (IBAction)btnDrivList:(id)sender;
/**忘记密码*/
- (IBAction)btnPW:(id)sender;
/**登录btn*/
- (IBAction)btnLogin:(id)sender;

/**身份证号*/
@property (weak, nonatomic) IBOutlet UITextField *tFNo;

/**密码*/
@property (weak, nonatomic) IBOutlet UITextField *tFPassword;
/**登录btn*/
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
/**学员数据模型*/
@property (nonatomic,strong)JWLoginModel *studentLogin;
@end


@implementation JWLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//登录xib
- (id)init
{
    self = [super initWithNibName:@"JWLoginVC" bundle:nil];
    if (self) {
        // Something.
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**跳回选择驾校*/
- (IBAction)btnDrivList:(id)sender {
    JWDLTVController *tb = [[JWDLTVController alloc] init];
    [self presentViewController:tb animated:YES completion:nil];
}

/**忘记密码*/
- (IBAction)btnPW:(id)sender {
    [MBProgressHUD showError:@"请联系驾校修改密码!"];
}
/**登录按钮*/
- (IBAction)btnLogin:(id)sender {
    if(self.tFNo.text.length !=0 && self.tFPassword.text.length !=0)
    {
        [self StLogin];
    }else if (self.tFNo.text.length == 0)
    {
        [MBProgressHUD showError:@"请输入身份证号码"];
    }else if (self.tFPassword.text.length == 0)
    {
        [MBProgressHUD showError:@"请输入密码"];
    }
    
}

/**登录响应*/
- (void)StLogin
{
    [MBProgressHUD showMessage:@"正在拼命登录中..."];
    NSString *accountID = self.tFNo.text;
    NSString *password = self.tFPassword.text;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:accountID forKey:@"accountID"];
    [ud setObject:password forKey:@"password"];
    [ud synchronize];
    [JiaxiaotongAPI requsetStuLoginByStuLogin:nil andCallback:^(id obj) {
        self.studentLogin = (JWLoginModel *)obj;
        //保存身份证号
        NSString *IDCardNum = self.studentLogin.per_idcardno;
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:IDCardNum forKey:@"per_idcardno"];
        [ud synchronize];
        JWLog(@"%@",self.studentLogin.issuccess);
        
        if ([self.studentLogin.issuccess isEqualToString:@"true"]) {
            //隐藏蒙板
            [MBProgressHUD hideHUD];
            
            //加载主界面
            JWTarBarController *tb = [[JWTarBarController alloc] init];
            [self presentViewController:tb animated:YES completion:nil];
            [MBProgressHUD showSuccess:@"学员登录成功！祝您学车愉快！"];
            
        }else if([self.studentLogin.issuccess isEqualToString:@"false"]) {
            [MBProgressHUD showError:@"学员信息错误！"];
        }
    }];
}

///**登录后将驾校id传给公告*/
//- (void)loadNotice
//{
//    JWLoginController *stuLogin = [[JWLoginController alloc] init];
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud setObject:stuLogin.driveData forKey:@"drivecode"];
//    [ud synchronize];
//    NSLog(@"%@",stuLogin.driveData);
//    
//    JWNoticeTVController *tb = [[JWNoticeTVController alloc] init];
//    tb.driveData = stuLogin.driveData;
//}

@end
