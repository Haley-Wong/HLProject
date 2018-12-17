//
//  HLNavigationController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLNavigationController.h"

@interface HLNavigationController ()

@end

@implementation HLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_initSetting];
}

- (void)p_initSetting
{
    self.navigationBar.translucent = NO;
    //让导航栏地下的黑线消失
//    self.navigationBar.shadowImage = [UIImage new];
    
//    [UIBarButtonItem appearance].tintColor = [UIColor whiteColor];
//    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateNormal];//将title 文字的颜色改为透明
}

@end
