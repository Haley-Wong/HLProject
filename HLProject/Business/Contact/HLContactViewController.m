//
//  HLContactViewController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLContactViewController.h"
#import "HLContactDetailViewController.h"

@interface HLContactViewController ()

@property (nonatomic, assign) BOOL needAnimation;

@end

@implementation HLContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"通讯录";
    
    // 从无导航栏页面跳转到有导航栏的页面
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"进入通讯录详情" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.needAnimation) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    } else {
        [self.navigationController setNavigationBarHidden:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.needAnimation = NO;
}

- (void)enterDetail
{
    HLContactDetailViewController *secondDetailVC = [[HLContactDetailViewController alloc] init];
    secondDetailVC.hidesBottomBarWhenPushed = YES;
    self.needAnimation = YES;
    [self.navigationController pushViewController:secondDetailVC animated:YES];
}

@end
