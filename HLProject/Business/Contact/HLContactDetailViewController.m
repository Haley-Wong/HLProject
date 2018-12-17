//
//  HLContactDetailViewController.m
//  HLProject
//
//  Created by Haley on 2018/12/12.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLContactDetailViewController.h"

@interface HLContactDetailViewController ()

@end

@implementation HLContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通讯录详情";
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"这是通讯录的详情" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


@end
