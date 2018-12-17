//
//  UIViewController+BackItem.h
//  BaseTest
//
//  Created by Haley on 2018/10/23.
//  Copyright © 2018年 Haley. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackItemProtocol <NSObject>

- (BOOL)navigationShouldPopWhenBackButtonClick;

@end

@interface UIViewController (BackItem)<BackItemProtocol>

@end

@interface UINavigationController (BackItem)

@end
