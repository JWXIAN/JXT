//
//  JWProfileView.m
//  JXT
//
//  Created by JWX on 15/6/28.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWProfileView.h"

@interface JWProfileView ()
@property (nonatomic,retain) NSMutableArray *cellArray;
@end

@implementation JWProfileView

- (id)init
{
    self = [super initWithNibName:@"JWProfileView" bundle:nil];
    if (self) {
        // Something.
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellArray = [NSMutableArray arrayWithObjects: _headCell, _noCell, _dataCell, _allCell, _endCell, _syCell, _kjCell, nil];
//    self.tableView.rowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview deleagate datasource stuff
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return ((UITableViewCell*)[self.cellArray objectAtIndex:indexPath.row]).frame.size.height;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return self.cellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //return cell for particular row
    cell = [self.cellArray objectAtIndex:indexPath.row];
    return cell;
}

@end
