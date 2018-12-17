//
//  HLBaseViewController.m
//  HLProject
//
//  Created by Harvey on 2018/11/27.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLBaseViewController.h"

@interface HLBaseViewController ()

@end

@implementation HLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc
{
    NSLog(@"%@ --- dealloc", NSStringFromClass([self class]));
}

@end
