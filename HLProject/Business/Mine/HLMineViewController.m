//
//  HLMineViewController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLMineViewController.h"
#import "HLMineDetailViewController.h"
#import "UINavigationController+HLPushAndPop.h"

@interface HLMineViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation HLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self p_initNavigationBar];
    
    [self p_initSubViews];
    
    [self p_loadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.title = [NSString stringWithFormat:@"我(%d)", (int)self.navigationController.childViewControllers.count];
}

#pragma mark - private method
- (void)p_initNavigationBar
{
    self.title = @"我";
}

- (void)p_initSubViews
{
    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = [UIView new];
}

- (void)p_loadData
{
    self.titles = @[
                    @[@"普通Push到我的列表页",@"普通Push到我的详情页"],
                    @[@"方法1Push到我的详情页",@"方法2Push到我的详情页",@"方法3Push到我的详情页",@"方法4Push到我的详情页",@"方法5Push到我的详情页"]
                    ];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *titleArray = self.titles[section];
    
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"identifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    NSArray *titleArray = self.titles[indexPath.section];
    cell.textLabel.text = titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        UIViewController *viewController = nil;
        if (indexPath.row == 0) {
            viewController = [[HLMineViewController alloc] init];
        } else if (indexPath.row == 1) {
            viewController = [[HLMineDetailViewController alloc] init];
        }
        [self.navigationController pushViewController:viewController animated:YES];
        return;
    }
    
    if (indexPath.section == 1) {
        UIViewController *viewController = nil;
        if (indexPath.row == 0) {
            viewController = [[HLMineDetailViewController alloc] init];
            [self.navigationController hl_pushSingleViewController:viewController animated:YES];
        } else if (indexPath.row == 1) {
            viewController = [[HLMineDetailViewController alloc] init];
            [self.navigationController hl_pushSingleViewController:viewController parentClass:HLBaseViewController.class animated:YES];
        } else if (indexPath.row == 2) {
            viewController = [[HLMineDetailViewController alloc] init];
            [self.navigationController hl_pushViewController:viewController closeTopViewController:YES animated:YES];
        } else if (indexPath.row == 3) {
            viewController = [[HLMineDetailViewController alloc] init];
            [self.navigationController hl_pushViewController:viewController butBeforeViewController:self animated:YES];
        } else if (indexPath.row == 4) {
            viewController = [[HLMineDetailViewController alloc] init];
            [self.navigationController hl_pushViewController:viewController butBeforeClass:self.class animated:YES];
        }
        return;
    }
}

@end
