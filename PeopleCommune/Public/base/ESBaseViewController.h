//
//  ESBaseViewController.h
//  eShop
//
//  Created by Kyle on 14-10-11.
//  Copyright (c) 2014年 yujiahui. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ESErrorView.h"
//#import "LXErrorView.h"
//#import "LXLoadingView.h"
//#import "ESLoadingView.h"
//#import "SVProgressHelper.h"
//#import "Config.h"
//#import "UIHelper.h"
//#import "Marco.h"
//#import "LXUIManager.h"
//#import "UINavigationController+FDFullscreenPopGesture.h"
//#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
@interface ESBaseViewController : UIViewController

//@property (nonatomic, strong) UIBarButtonItem *backButtonItem;
//
//@property (nonatomic, assign) NSInteger enterCount;
//@property (nonatomic, assign) BOOL isFirstAppear;
//@property (nonatomic, assign) BOOL isLoadData;
//@property (nonatomic, assign) BOOL isShowLoadView;
//
//@property (nonatomic, assign) BOOL isMonitorUserChange;
//
//@property (nonatomic, weak) UIViewController *pageViewController;
//
//@property(nonatomic,strong)LXErrorView *lxErrorView;
//@property(nonatomic,strong)LXLoadingView *lxLoadingView;
////初始化方法  会在viewDidLoad 之前
- (void)setup;

- (void)showLoadingView;
- (void)hiddenLoadingView;

- (void)contentRefresh;
- (void)userExpired;
- (void)errorActionHelp;
- (void)contentLoadMore;

- (void)networkErrorNotice;
- (void)shopEmptyNotice;
- (void)orderEmptyNotice;
- (void)showNoticeImage:(UIImage *)image text:(NSString *)text;
- (void)showNoticeImage:(UIImage *)image text:(NSString *)text buttonTitle:(NSString *)title;
- (void)removeErrorView;

-(void)userDidChanged; //登录，注销登录收到通知

- (void)backAction:(id)sender; //返回上一层，或者是 pop， 或者是 dissmiss

- (void)handleWillAppearNotification:(NSNotification *)notif;
- (void)handleDidApperaNotification:(NSNotification *)notif;
- (void)handleWillDisappearNotification:(NSNotification *)notif;
- (void)handleDidDisappearNotification:(NSNotification *)notif;

/**
 *  提示优惠券通知
 *
 *  @param coupon 优惠券（考虑通知弹出）
 */
- (void)checkCouponPushViewController:(UIViewController *)viewController;
- (void)checkCoupon;
- (void)closeCoupon;

/**
 *  提示绑定信息
 *
 */

- (void)showAccountBindMsg:(NSString *)msg;

//某些时候强制加返回 push viewcontroller , 在viewDidLoad 里面偶尔没有navigationcontroller
- (void)setCustomNavigationBackButton;


@end
