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

@interface JWDLTVController ()
@property (nonatomic,strong)NSMutableArray *driveHeads;
@end

@implementation JWDLTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.driveHeads = [NSMutableArray array];
    //
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell== nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"cell" owner:self options:nil]lastObject];
    }
    JWDriveBodyModel *driveBody = self.driveHeads[indexPath.row];
    cell.textLabel.text = driveBody.qyname;
    return cell;
}
@end
