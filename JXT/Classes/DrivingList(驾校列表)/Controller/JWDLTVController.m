//
//  JWDLTVController.m
//  JXT
//
//  Created by JWX on 15/6/21.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWDLTVController.h"
#import "JsonPaser.h"
#import "JiaxiaotongAPI.h"
#import "AFNetworking.h"
#import "JWDriveBodyModel.h"
#import "JWDriveHeadModel.h"
#import "JWDLTVCell.h"
#import "JWLoginController.h"

@interface JWDLTVController ()
@property (nonatomic,strong)NSMutableArray *driveHeads;
@end

@implementation JWDLTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"驾校列表";
    self.driveHeads = [NSMutableArray array];
    self.tableView.rowHeight = 110;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *uid = [ud objectForKey:@"driveID"];
    [JiaxiaotongAPI requestDriveByDriveID:uid andCallback:^(id obj) {
        JWDriveHeadModel *drive = (JWDriveHeadModel *)obj;
        self.driveHeads = drive.driveHeads;
        [self.tableView reloadData];
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.driveHeads.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    JWDLTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell== nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JWDLTVCell" owner:self options:nil]lastObject];
    }
    cell.driveData = self.driveHeads[indexPath.row];
    return cell;
}

////选择后跳转到登陆页面 将驾校名传到登陆页面
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    DriveData *driveData = self.driveDatas[indexPath.row];
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud setObject:driveData.qyid forKey:@"drivecode"];
//    [ud synchronize];
//    NSLog(@"%@",driveData.qyid);
//    
//    JWLoginController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Loginvc"];
//    lvc.driveData = driveData;
//    
//    [self presentViewController:lvc animated:YES completion:nil];
//    NSLog(@"%ld",(long)indexPath.row);
//    
//}
@end
