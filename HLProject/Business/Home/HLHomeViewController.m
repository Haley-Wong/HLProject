//
//  HLHomeViewController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLHomeViewController.h"
#import "HLHomeDetailViewController.h"

@interface HLHomeViewController ()

@property (nonatomic, assign) BOOL needAnimation;

@end

@implementation HLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"首页";
    
    // 从有导航栏页面跳转到无导航栏页面，因为没有导航栏，所以侧滑返回功能无效
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"进入首页的详情" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.needAnimation) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    } else {
        [self.navigationController setNavigationBarHidden:NO];
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    self.needAnimation = NO;
}

- (void)rightClick
{
    HLHomeDetailViewController *secondDetailVC = [[HLHomeDetailViewController alloc] init];
    secondDetailVC.hidesBottomBarWhenPushed = YES;
    self.needAnimation = YES;
    [self.navigationController pushViewController:secondDetailVC animated:YES];
}

@end
