//
//  UIViewController+BackItem.m
//  BaseTest
//
//  Created by Haley on 2018/10/23.
//  Copyright © 2018年 Haley. All rights reserved.
//

#import "UIViewController+BackItem.h"

@implementation UIViewController (BackItem)

- (BOOL)navigationShouldPopWhenBackButtonClick
{
    return YES;
}

@end


@implementation UINavigationController (BackItem)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController *vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopWhenBackButtonClick)]) {
        shouldPop = [vc navigationShouldPopWhenBackButtonClick];
    }
    
    if (shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1;
                }];
            }
        }
    }
    return NO;
}

@end
