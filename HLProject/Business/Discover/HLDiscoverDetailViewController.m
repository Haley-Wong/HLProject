//
//  HLDiscoverDetailViewController.m
//  HLProject
//
//  Created by Haley on 2018/12/12.
//  Copyright © 2018 Haley. All rights reserved.
//

#import "HLDiscoverDetailViewController.h"

@interface HLDiscoverDetailViewController ()

@end

@implementation HLDiscoverDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现详情";
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300, 40)];
    textField.backgroundColor = [UIColor redColor];
    textField.placeholder = @"输入内容时，点击返回试试";
    textField.textColor = [UIColor whiteColor];
    [self.view addSubview:textField];
}

- (BOOL)navigationShouldPopWhenBackButtonClick
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"是否保存修改" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 这里执行保存操作，然后再返回。
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:saveAction];
    [self presentViewController:alertVC animated:YES completion:nil];
    return NO;
}

@end
