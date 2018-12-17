//
//  UINavigationController+HLPushAndPop.m
//  NavigationPop
//
//  Created by Haley on 2018/11/2.
//  Copyright © 2018年 Haley. All rights reserved.
//

#import "UINavigationController+HLPushAndPop.h"

@implementation UINavigationController (HLPushAndPop)

- (void)hl_pushSingleViewController:(UIViewController *)viewController
                           animated:(BOOL)animated
{
    [self hl_pushSingleViewController:viewController parentClass:viewController.class animated:animated];
}

- (void)hl_pushSingleViewController:(UIViewController *)viewController
                        parentClass:(Class)parentClass
                           animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    // 如果要push的界面不是 parentClass以及其子类的实例，则按照方法1处理
    if (![viewController isKindOfClass:parentClass]) {
        [self hl_pushSingleViewController:viewController animated:animated];
        return;
    }
    
    // 判断 导航控制器堆栈中是否有parentClass以及其子类的实例
    NSArray *childViewControllers = self.childViewControllers;
    NSMutableArray *newChildVCs = [[NSMutableArray alloc] initWithArray:childViewControllers];
    BOOL isExit = NO;
    NSInteger index = 0;
    for (int i = 0; i < childViewControllers.count; i++) {
        UIViewController *vc = childViewControllers[i];
        if ([vc isKindOfClass:parentClass]) {
            isExit = YES;
            index = i;
            break;
        }
    }
    
    // 如果不存在，则直接push
    if (!isExit) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    
    // 如果存在，则将该实例及上面的所有界面全部弹出栈，然后将要push的界面放到栈顶。
    for (NSInteger i = childViewControllers.count - 1; i >= index; i--) {
        [newChildVCs removeObjectAtIndex:i];
    }
    
    [newChildVCs addObject:viewController];
    viewController.hidesBottomBarWhenPushed = (newChildVCs.count > 1);
    [self setViewControllers:newChildVCs animated:animated];
}

/**
 push 出一个控制器
 在push 之前，可以先关闭当前的topViewController

 @param viewController 将要push的控制器
 @param closeTop 是否关闭topViewContoller
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
       closeTopViewController:(BOOL)closeTop
                     animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    
    if (!closeTop) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    // 如果需要关闭顶层控制器，再push
    NSArray *childViewControllers = self.childViewControllers;
    NSMutableArray *newChildVCs = [[NSMutableArray alloc] initWithArray:childViewControllers];
    [newChildVCs removeLastObject];
    [newChildVCs addObject:viewController];
    viewController.hidesBottomBarWhenPushed = (newChildVCs.count > 1);
    [self setViewControllers:newChildVCs animated:animated];
}

/**
 push 出一个控制器
 但是要保证该控制器要在某个目标控制器的前面，这样返回时，目标控制器之后的界面都不会再显示
 遍历方式是从栈顶往栈底遍历。
 
 @param viewController 将要push的控制器
 @param targetViewController 目标控制器
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
      butBeforeViewController:(UIViewController *)targetViewController
                     animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    
    if (!targetViewController) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    NSArray *childViewControllers = self.childViewControllers;
    NSMutableArray *newChildVCs = [[NSMutableArray alloc] initWithArray:childViewControllers];
    // 判断 导航控制器堆栈中是否有 目标界面
    BOOL isExit = NO;
    NSMutableArray *willMoveArray = [NSMutableArray array];
    for (NSInteger i = childViewControllers.count - 1; i >= 0; i--) {
        UIViewController *vc = childViewControllers[i];
        [willMoveArray addObject:vc];
        if (vc == targetViewController) {
            isExit = YES;
            break;
        }
    }
    
    // 如果没有，则直接push
    if (!isExit) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    // 如果有，则将该实例及上面的所有界面全部出栈，然后将要push的界面放到栈顶。
    [newChildVCs removeObjectsInArray:willMoveArray];
    [newChildVCs addObject:viewController];
    viewController.hidesBottomBarWhenPushed = (newChildVCs.count > 1);
    [self setViewControllers:newChildVCs animated:animated];
}

/**
 push 出一个控制器，功能与hl_pushViewController:butBeforeViewController:animated:类似
 针对知道某个目标控制器类型，无法获取目标控制器实例的场景。
 遍历方式是从栈顶往栈底遍历。
 
 @param viewController 将要push的控制器
 @param targetClass 目标控制器的类型
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
               butBeforeClass:(Class)targetClass
                     animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    NSArray *childViewControllers = self.childViewControllers;
    NSMutableArray *newChildVCs = [[NSMutableArray alloc] initWithArray:childViewControllers];
    // 判断 导航控制器堆栈中是否有 目标类型
    BOOL isExit = NO;
    NSMutableArray *willMoveArray = [NSMutableArray array];
    for (NSInteger i = childViewControllers.count - 1; i >= 0; i--) {
        UIViewController *vc = childViewControllers[i];
        [willMoveArray addObject:vc];
        if ([vc isKindOfClass:targetClass]) {
            isExit = YES;
            break;
        }
    }
    
    // 如果没有，则直接push
    if (!isExit) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    
    // 如果有，则将该实例及上面的所有界面全部移除，然后将要push的界面放到栈顶。
    [newChildVCs removeObjectsInArray:willMoveArray];
    [newChildVCs addObject:viewController];
    viewController.hidesBottomBarWhenPushed = (newChildVCs.count > 1);
    [self setViewControllers:newChildVCs animated:animated];
}

/**
 push 出一个控制器，功能与hl_pushViewController:butBeforeViewController:animated:类似
 针对知道具体的目标控制器实例的场景。
 
 @param viewController 将要push的控制器
 @param targetViewController 目标控制器
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
       butAfterViewController:(UIViewController *)targetViewController
                     animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    
    if (!targetViewController) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    
    NSArray *childViewControllers = self.childViewControllers;
    NSMutableArray *newChildVCs = [[NSMutableArray alloc] initWithArray:childViewControllers];
    // 判断 导航控制器堆栈中是否有 目标界面
    BOOL isExit = NO;
    NSMutableArray *willMoveArray = [NSMutableArray array];
    for (NSInteger i = childViewControllers.count - 1; i >= 0; i--) {
        UIViewController *vc = childViewControllers[i];
        if (vc == targetViewController) {
            isExit = YES;
            break;
        }
        [willMoveArray addObject:vc];
    }
    
    // 如果没有，则直接push
    if (!isExit) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    // 如果有，则将该实例上面的所有界面全部出栈，然后将要push的界面放到栈顶。
    [newChildVCs removeObjectsInArray:willMoveArray];
    [newChildVCs addObject:viewController];
    viewController.hidesBottomBarWhenPushed = (newChildVCs.count > 1);
    [self setViewControllers:newChildVCs animated:animated];
}

/**
 push 出一个控制器，功能与hl_pushViewController:butBeforeViewController:animated:类似
 针对知道某个目标控制器类型，无法获取目标控制器实例的场景。
 遍历方式是从栈顶往栈底遍历。
 
 @param viewController 将要push的控制器
 @param targetClass 目标控制器的类型
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
                butAfterClass:(Class)targetClass
                     animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    NSArray *childViewControllers = self.childViewControllers;
    NSMutableArray *newChildVCs = [[NSMutableArray alloc] initWithArray:childViewControllers];
    // 判断 导航控制器堆栈中是否有 目标类型
    BOOL isExit = NO;
    NSMutableArray *willMoveArray = [NSMutableArray array];
    for (NSInteger i = childViewControllers.count - 1; i >= 0; i--) {
        UIViewController *vc = childViewControllers[i];
        if ([vc isKindOfClass:targetClass]) {
            isExit = YES;
            break;
        }
        [willMoveArray addObject:vc];
    }
    
    // 如果没有，则直接push
    if (!isExit) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    
    // 如果有，则将该实例上面的所有界面全部移除，然后将要push的界面放到栈顶。
    [newChildVCs removeObjectsInArray:willMoveArray];
    [newChildVCs addObject:viewController];
    viewController.hidesBottomBarWhenPushed = (newChildVCs.count > 1);
    [self setViewControllers:newChildVCs animated:animated];
}

#pragma mark - pop
/**
 pop 到指定控制器界面
 针对只知道目标控制器类型，无法获取实例的情况
 从栈底往栈顶遍历，如果不存在该类型的控制器，则执行普通的pop操作
 
 @param targetClass 要返回到的控制器的Class
 @param animated 是否动画
 */
- (void)hl_popToviewControllerClass:(Class)targetClass
                           animated:(BOOL)animated
{
    NSArray *childViewControllers = self.childViewControllers;
    UIViewController *targetController = nil;
    for (int i = 0; i < childViewControllers.count; i++) {
        UIViewController *vc = childViewControllers[i];
        if ([vc isKindOfClass:targetClass]) {
            targetController = vc;
            break;
        }
    }
    
    // 如果存在，则pop到指定页面
    if (targetController) {
        [self popToViewController:targetController animated:animated];
        return;
    }
    
    [self popViewControllerAnimated:animated];
}

@end
