//
//  HLTabBarController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLTabBarController.h"
#import "HLNavigationController.h"
#import "HLHomeViewController.h"
#import "HLContactViewController.h"
#import "HLDiscoverViewController.h"
#import "HLMineViewController.h"

@interface HLTabBarController ()

@end

@implementation HLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_initControllers];
}

#pragma mark - private method
- (void)p_initControllers
{
    HLHomeViewController *homeVC = [[HLHomeViewController alloc] init];
    [self addChildVC:homeVC title:@"消息" imageName:@"btn-xiaoxi-n" selectedName:@"btn-xiaoxi-h"];
    
    HLContactViewController *musicVC = [[HLContactViewController alloc] init];
    [self addChildVC:musicVC title:@"通讯录" imageName:@"btn-tongxunlu-n" selectedName:@"btn-tongxunlu-h"];
    
    HLDiscoverViewController *discoverVC = [[HLDiscoverViewController alloc] init];
    [self addChildVC:discoverVC title:@"发现" imageName:@"btn-gongzuo-n" selectedName:@"btn-gongzuo-h"];
    
    HLMineViewController *mineVC = [[HLMineViewController alloc] init];
    [self addChildVC:mineVC title:@"我的" imageName:@"btn-wo-n" selectedName:@"btn-wo-h"];
}

- (void)addChildVC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selectedName:(NSString *)selectedName
{
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    VC.title = title;
    HLNavigationController *baseNav = [[HLNavigationController alloc] initWithRootViewController:VC];
    
    [self addChildViewController:baseNav];
}


@end
