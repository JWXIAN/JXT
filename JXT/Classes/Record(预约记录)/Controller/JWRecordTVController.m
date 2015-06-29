//
//  JWRecordTVController.m
//  JXT
//
//  Created by JWX on 15/6/21.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWRecordTVController.h"
#import "DZNSegmentedControl.h"

/**Segment define*/
#define _allowAppearance    NO
#define _bakgroundColor     [UIColor colorWithRed:0/255.0 green:87/255.0 blue:173/255.0 alpha:1.0]
#define _tintColor          [UIColor colorWithRed:20/255.0 green:200/255.0 blue:255/255.0 alpha:1.0]
#define _hairlineColor      [UIColor colorWithRed:0/255.0 green:36/255.0 blue:100/255.0 alpha:1.0]

@interface JWRecordTVController ()<DZNSegmentedControlDelegate>
/**Segment*/
@property (nonatomic, strong) DZNSegmentedControl *control;
@property (nonatomic, strong) NSArray *menuItems;

/**预约记录数据模型*/
@property (nonatomic,strong)NSMutableArray *recordBodys;

@end

@implementation JWRecordTVController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //预约信息分组
    _menuItems = @[[@"全部" uppercaseString],
                   [@"预约" uppercaseString],
                   [@"培训" uppercaseString],
                   [@"退约" uppercaseString]];
    self.tableView.tableHeaderView = self.control;
    self.tableView.tableFooterView = [UIView new];
<<<<<<< HEAD
=======
    //预约数据显示
    [self loadRecord];
>>>>>>> origin/master
}

/**加载预约信息*/
- (void)loadRecord
{
<<<<<<< HEAD
    [MBProgressHUD showMessage:@"正在加载预约信息..."];
    self.recordHeads = [NSMutableArray array];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *stuid = [ud objectForKey:@"stuID"];
    [JiaxiaotongAPI requestBookRecordByBookRecord:stuid andCallback:^(id obj) {
        JWRecordHeadModel *record = (JWRecordHeadModel *)obj;
        if (record != nil) {
            self.recordHeads = record.recordHeads;
            [self.tableView reloadData];
            [self updateControlCounts];
            [MBProgressHUD hideHUD];
        }
    }];
    
=======
    //    self.driveDatas = [NSMutableArray array];
    //    //
    //    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //    NSString *uid = [ud objectForKey:@"driveID"];
    //    [JiaxiaotongAPI requestDriveByDriveID:uid andCallback:^(id obj) {
    //        Drive *drive = (Drive *)obj;
    //        self.driveDatas = drive.driveDatas;
    //        [self.tableView reloadData];
    //        
    //    }];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**返回cell数据行*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


#pragma mark - 数据源代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ #%d", [[self.control titleForSegmentAtIndex:self.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
>>>>>>> origin/master
}

#pragma mark - Segment分组实现
/**顶部Segment*/
+ (void)load
{
    if (!_allowAppearance) {
        return;
    }
    
    [[DZNSegmentedControl appearance] setBackgroundColor:_bakgroundColor];
    [[DZNSegmentedControl appearance] setTintColor:_tintColor];
    [[DZNSegmentedControl appearance] setHairlineColor:_hairlineColor];
    
    [[DZNSegmentedControl appearance] setFont:[UIFont fontWithName:@"EuphemiaUCAS" size:15.0]];
    [[DZNSegmentedControl appearance] setSelectionIndicatorHeight:2.5];
    [[DZNSegmentedControl appearance] setAnimationDuration:0.125];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor], NSFontAttributeName: [UIFont systemFontOfSize:18.0]}];
}

/**加载左右侧bar*/
- (void)loadView
{
    [super loadView];
    //    //右侧添加bar
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSegment:)];
    //预约数据显示
    [self loadData];
    //左侧刷新bar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshSegments:)];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateControlCounts];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (DZNSegmentedControl *)control
{
    if (!_control)
    {
        _control = [[DZNSegmentedControl alloc] initWithItems:self.menuItems];
        _control.delegate = self;
        _control.selectedSegmentIndex = 1;
        _control.bouncySelectionIndicator = YES;
        [_control addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _control;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - ViewController Methods

///**右侧添加cell*/
//- (void)addSegment:(id)sender
//{
//    NSUInteger newSegment = self.control.numberOfSegments;
//    
//    [self.control setTitle:[@"Favorites" uppercaseString] forSegmentAtIndex:self.control.numberOfSegments];
//    [self.control setCount:@((arc4random()%10000)) forSegmentAtIndex:newSegment];
//}

/**左侧刷新cell*/
- (void)refreshSegments:(id)sender
{
    [self.control removeAllSegments];
    
    [self.control setItems:self.menuItems];
    [self updateControlCounts];
}

/**顶部控制器统计*/
- (void)updateControlCounts
{
    [self.control setCount:@((arc4random()%10000)) forSegmentAtIndex:0];
    [self.control setCount:@((arc4random()%10000)) forSegmentAtIndex:1];
    [self.control setCount:@((arc4random()%10000)) forSegmentAtIndex:2];
    [self.control setCount:@((arc4random()%10000)) forSegmentAtIndex:3];
    
    if (_allowAppearance) {
        [self.control setTitleColor:_hairlineColor forState:UIControlStateNormal];
    }
}

- (void)selectedSegment:(DZNSegmentedControl *)control
{
    [self.tableView reloadData];
}


#pragma mark - UIBarPositioningDelegate Methods

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionBottom;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDataSource Methods

/**返回cell数据行*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.recordHeads.count;
}


#pragma mark - 数据源代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    JWRecordTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JWRecordTVCell" owner:self options:nil]lastObject];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    
    cell.stuBookRecordInfo = self.recordHeads[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

@end
