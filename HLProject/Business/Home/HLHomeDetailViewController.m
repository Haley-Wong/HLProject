//
//  HLHomeDetailViewController.m
//  HLProject
//
//  Created by Haley on 2018/12/12.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLHomeDetailViewController.h"

@interface HLHomeDetailViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) id interactivePopDelegate;

@end

@implementation HLHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页详情";
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"这是首页的详情" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.interactivePopDelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self.interactivePopDelegate;
    self.interactivePopDelegate = nil;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}


@end
