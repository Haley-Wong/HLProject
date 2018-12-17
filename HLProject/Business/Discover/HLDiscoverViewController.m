//
//  HLDiscoverViewController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLDiscoverViewController.h"
#import "HLDiscoverDetailViewController.h"

@interface HLDiscoverViewController ()

@end

@implementation HLDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"发现";
    
    // 从有导航栏页面跳转到无导航栏页面，因为没有导航栏，所以侧滑返回功能无效
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"进入发现的详情" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)rightClick
{
    HLDiscoverDetailViewController *secondDetailVC = [[HLDiscoverDetailViewController alloc] init];
    secondDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secondDetailVC animated:YES];
}

@end
