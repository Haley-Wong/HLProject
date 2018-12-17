//
//  UINavigationController+HLPushAndPop.h
//  NavigationPop
//
//  Created by Haley on 2018/11/2.
//  Copyright © 2018年 Haley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HLPushAndPop)

#pragma mark - push
/**
 push 出一个控制器
 该方法的效果类似Android中的SingleTask
 从栈底往栈顶遍历，如果栈中存在该类型的实例，则将该实例以及其上的所有对象都移除，
 然后，将要push的控制器插入到该位置

 @param viewController 将要push 的控制器
 @param animated 是否动画
 */
- (void)hl_pushSingleViewController:(UIViewController *)viewController
                           animated:(BOOL)animated;

/**
 push 出一个控制器
 该方法的效果类似Android中的SingleTask，
 不同的是会先判断要push的控制器是否是parentClass以及其子类的实例，
 如果是，则判断从栈底往栈顶遍历找到parentClass以及其子类的实例，则将该实例以及其上的所有对象移除，
 然后，将要push的控制器插入找到的实例所在的位置。
 如果要push的控制器不是是parentClass以及其子类的实例，则按照hl_pushSingleViewController:animated:处理
 
 @param viewController 将要push的控制器
 @param parentClass 将要push 出的控制器的父类Class
 @param animated 是否动画
 */
- (void)hl_pushSingleViewController:(UIViewController *)viewController
                         parentClass:(Class)parentClass
                            animated:(BOOL)animated;

/**
 push 出一个控制器
 在push 之前，可以先关闭当前的topViewController
 
 @param viewController 将要push的控制器
 @param closeTop 是否关闭topViewContoller
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
       closeTopViewController:(BOOL)closeTop
                     animated:(BOOL)animated;

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
                     animated:(BOOL)animated;

/**
 push 出一个控制器，功能与hl_pushViewController:butBeforeViewController:animated:类似
 针对知道某个目标控制器类型，无法获取目标控制器实例的场景。
 
 @param viewController 将要push的控制器
 @param targetClass 目标控制器的类型
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
               butBeforeClass:(Class)targetClass
                     animated:(BOOL)animated;

/**
 push 出一个控制器，功能与hl_pushViewController:butBeforeViewController:animated:类似
 针对知道具体的目标控制器实例的场景。
 
 @param viewController 将要push的控制器
 @param targetViewController 目标控制器
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
       butAfterViewController:(UIViewController *)targetViewController
                     animated:(BOOL)animated;

/**
 push 出一个控制器，功能与hl_pushViewController:butBeforeViewController:animated:类似
 针对知道某个目标控制器类型，无法获取目标控制器实例的场景。
 
 @param viewController 将要push的控制器
 @param targetClass 目标控制器的类型
 @param animated 是否动画
 */
- (void)hl_pushViewController:(UIViewController *)viewController
               butAfterClass:(Class)targetClass
                     animated:(BOOL)animated;

#pragma mark - pop
/**
 pop 到指定控制器界面
 针对只知道目标控制器类型，无法获取实例的情况
 从栈底往栈顶遍历，如果不存在该类型的控制器，则执行普通的pop操作
 
 @param targetClass 要返回到的控制器的Class
 @param animated 是否动画
 */
- (void)hl_popToviewControllerClass:(Class)targetClass
                           animated:(BOOL)animated;

@end
