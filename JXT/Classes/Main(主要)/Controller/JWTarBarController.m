//
//  JWTarBarController.m
//  JXT
//
//  Created by JWX on 15/6/19.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWTarBarController.h"
#import "JWRecordTVController.h"
#import "JWTarBarController.h"
#import "JWHomeTVController.h"
#import "JWVehicleTVController.h"
#import "JWNavController.h"
#import "PrefixHeader.pch"
#import "JWDLTVController.h"
#import "JWProfileTVController.h"
#import "MJExtension.h"
#import "JWNoticeTVController.h"
#import "JWProfileTVCell.h"

@interface JWTarBarController ()
@end

@implementation JWTarBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // 1.初始化子控制器
//    JWNoticeTVController *home = [[JWNoticeTVController alloc] init];
//    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:nil];
    
    JWHomeTVController *home = [[JWHomeTVController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:nil];
    
    JWVehicleTVController *messageCenter = [[JWVehicleTVController alloc] init];
    [self addChildVc:messageCenter title:@"车辆预约" image:@"tabbar_message_center" selectedImage:nil];
    
    JWRecordTVController *discover = [[JWRecordTVController alloc] init];
    [self addChildVc:discover title:@"预约记录" image:@"tabbar_discover" selectedImage:nil];
    
    JWProfileTVController *setting = [[JWProfileTVController alloc] init];
    [self addChildVc:setting title:@"设置" image:@"tabbar_home" selectedImage:nil];
    
//    JWDLTVController *drive = [[JWDLTVController alloc] init];
//    [self addChildVc:drive title:@"驾校列表" image:@"tabbar_profile" selectedImage:@
//     ""];
    
    
    // 2.更换系统自带的tabbar
//    HWTabBar *tabBar = [[HWTabBar alloc] init];
//    [self setValue:tabBar forKeyPath:@"tabBar"];
    /*
     [self setValue:tabBar forKeyPath:@"tabBar"];相当于self.tabBar = tabBar;
     [self setValue:tabBar forKeyPath:@"tabBar"];这行代码过后，tabBar的delegate就是HWTabBarViewController
     说明，不用再设置tabBar.delegate = self;
     */
    
    /*
     1.如果tabBar设置完delegate后，再执行下面代码修改delegate，就会报错
     tabBar.delegate = self;
     
     2.如果再次修改tabBar的delegate属性，就会报下面的错误
     错误信息：Changing the delegate of a tab bar managed by a tab bar controller is not allowed.
     错误意思：不允许修改TabBar的delegate属性(这个TabBar是被TabBarViewController所管理的)
     */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = JWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = JWColor(36, 107, 246);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    JWNavController *nav = [[JWNavController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}
//#pragma mark - HWTabBarDelegate代理方法
//- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
//{
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
//    [self presentViewController:vc animated:YES completion:nil];
//}

@end
