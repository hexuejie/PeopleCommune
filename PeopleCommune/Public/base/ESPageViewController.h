//
//  ESOrderPageViewController.h
//  eShop
//
//  Created by Kyle on 14/11/19.
//  Copyright (c) 2014年 yujiahui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"
#import "HMSegmentedControl.h"

@interface ESPageViewController : WMPageController
@property (nonatomic, assign,readonly) NSInteger currentPageIndex;
@property (nonatomic, strong) NSArray *subViewControllers;

-(void)didUpdateCurrentPageIndex:(NSInteger)index;

-(void)updateSegmentControllerFrame:(CGRect)frame;

@end

