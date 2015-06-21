//
//  JWVehicleTVController.m
//  JXT
//
//  Created by 李莉 on 15/6/19.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "JWVehicleTVController.h"
#import "JWTableViewControllerTest.h"
#import "DZNSegmentedControl.h"

#define _allowAppearance    NO
#define _bakgroundColor     [UIColor colorWithRed:0/255.0 green:87/255.0 blue:173/255.0 alpha:1.0]
#define _tintColor          [UIColor colorWithRed:20/255.0 green:200/255.0 blue:255/255.0 alpha:1.0]
#define _hairlineColor      [UIColor colorWithRed:0/255.0 green:36/255.0 blue:100/255.0 alpha:1.0]

@interface JWVehicleTVController ()<DZNSegmentedControlDelegate>
@property (nonatomic, strong) DZNSegmentedControl *control;
@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation JWVehicleTVController

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
    
    //    self.title = @"DZNSegmentedControl";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSegment:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshSegments:)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menuItems = @[[@"我的教练" uppercaseString], [@"全部教练" uppercaseString],];
    
    self.tableView.tableHeaderView = self.control;
    self.tableView.tableFooterView = [UIView new];
    
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

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ #%d", [[self.control titleForSegmentAtIndex:self.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JWTableViewControllerTest *test1 = [[JWTableViewControllerTest alloc] init];
    test1.title = @"测试1控制器";
    // 当test1控制器被push的时候，test1所在的tabbarcontroller的tabbar会自动隐藏
    // 当test1控制器被pop的时候，test1所在的tabbarcontroller的tabbar会自动显示
    //    test1.hidesBottomBarWhenPushed = YES;
    
    // self.navigationController === HWNavigationController
    [self.navigationController pushViewController:test1 animated:YES];
}

#pragma mark - ViewController Methods

/**右侧添加cell*/
- (void)addSegment:(id)sender
{
    NSUInteger newSegment = self.control.numberOfSegments;
    
    [self.control setTitle:[@"JWX" uppercaseString] forSegmentAtIndex:self.control.numberOfSegments];
    [self.control setCount:@((arc4random()%10000)) forSegmentAtIndex:newSegment];
}

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
@end
