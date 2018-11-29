//
//  ESOrderPageViewController.m
//  eShop
//
//  Created by Kyle on 14/11/19.
//  Copyright (c) 2014年 yujiahui. All rights reserved.
//

#import "ESPageViewController.h"
#import "Utility.h"
#import "UIHelper.h"
#import "UIView+AutoLayout.h"
#import "LXLineView.h"

#define kSegmentHeight 40

@interface ESPageViewController ()<WMPageControllerDataSource,WMPageControllerDelegate>


@end

@implementation ESPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleSizeSelected = 16;
    self.titleSizeNormal = 16;
    self.automaticallyCalculatesItemWidths = YES;
    self.titleColorNormal = UIColorFromRGB(0x333333);
    self.titleColorSelected = LXThemeColor;
    self.delegate = self;
    self.dataSource = self;
    self.progressHeight = 2.0;
    self.progressViewCornerRadius = 1.0;
    
}

#pragma mark
#pragma mark set viewcontroller

-(void)setSubViewControllers:(NSArray *)subViewControllers{
    
    _subViewControllers = subViewControllers;

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];

    [_subViewControllers enumerateObjectsUsingBlock:^(UIViewController *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.title != nil){
            [array addObject:obj.title];
        }else{
            [array addObject:@""];
        }

    }];

    self.titles = [array copy];

    [self reloadData];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {

    CGFloat tempOriginY = 0;
    if (self.edgesForExtendedLayout != UIRectEdgeNone && self.extendedLayoutIncludesOpaqueBars == true && self.navigationController.navigationBar != nil){
        tempOriginY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    }else{
        tempOriginY = 0;
    }
    
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : tempOriginY;
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}


- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return [_subViewControllers count];
}

-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    return _subViewControllers[index];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    if ([self.subViewControllers count] <= self.currentPageIndex ) {
        return UIStatusBarStyleDefault;
        
    }else{
        UIViewController *controller = [self.subViewControllers objectAtIndex:self.currentPageIndex];
        if ([controller respondsToSelector:@selector(preferredStatusBarStyle)]) {
            return [controller preferredStatusBarStyle];
        }
    }
    
    return UIStatusBarStyleDefault;
}
@end
