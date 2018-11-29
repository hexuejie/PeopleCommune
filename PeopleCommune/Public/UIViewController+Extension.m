//
//  UIViewController+Extension.m
//  lexiwed2
//
//  Created by Kyle on 2017/4/6.
//  Copyright © 2017年 乐喜网. All rights reserved.
//

#import "UIViewController+Extension.h"
//#import "UINavigationController+extension.h"
//#import "lexiwed2-Swift.h"

@implementation UIViewController(Extension)


- (UIViewController *)lx_topMostController {
    return [self lx_topViewControllerWithRootViewController];
}

- (UIViewController *)lx_topViewControllerWithRootViewController {
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)self;
        return [tabBarController.selectedViewController lx_topViewControllerWithRootViewController];
    } else if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)self;
        NSArray *subViewControllers = navigationController.viewControllers;
        return [subViewControllers.lastObject lx_topViewControllerWithRootViewController];
    } else if (self.presentedViewController && [self.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController* presentedViewController = self.presentedViewController;
        return [presentedViewController lx_topViewControllerWithRootViewController];
    } else {
        return self;
    }
}


@end
