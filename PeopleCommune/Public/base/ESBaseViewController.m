//
//  ESBaseViewController.m
//  eShop
//
//  Created by Kyle on 14-10-11.
//  Copyright (c) 2014年 yujiahui. All rights reserved.
//

#import "ESBaseViewController.h"
//#import "Utility.h"
//#import "NoticeHelp.h"
//#import "UserDefault.h"
//#import "UIViewController+Extension.h"
//@interface ESBaseViewController ()<ErrorViewDelegate,LXErrorViewDelegate>
//
//
//@end

@implementation ESBaseViewController

//@synthesize backButtonItem = _backButtonItem;


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
//        [self setup];
    }
    return self;
}

-(instancetype)init{
    return [self initWithNibName:nil bundle:nil];
}


- (void)dealloc
{
    NSLog(@"dealloc %@",self);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    NSLog(@"didReceiveMemoryWarning :%@",self);
//
//    [[SDWebImageManager sharedManager].imageCache clearMemory];
//    [Utility cleanAllCreateImage];
//
////    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0) {
////
////        //需要注意的是self.isViewLoaded是必不可少的，其他方式访问视图会导致它加载 ，在WWDC视频也忽视这一点。
////
////        if (self.isViewLoaded && !self.view.window)// 是否是正在使用的视图
////        {
////            // Add code to preserve data stored in the views that might be
////            // needed later.
////
////            // Add code to clean up other strong references to the view in
////            // the view hierarchy.
////            self.view = nil;// 目的是再次进入时能够重新加载调用viewDidLoad函数。
////        }
////    }
//}
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationController.navigationBar.barTintColor = HexRGB(0xffffff);
//    self.view.backgroundColor = LSSeparateColor;
//
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0],NSForegroundColorAttributeName:HexRGB(0x333333)}];
//
//    self.fd_interactivePopDisabled = false;
//
//    [self setCustomNavigationBackButton];
//
//
////    self.automaticallyAdjustsScrollViewInsets = TRUE;
//
//    self.isShowLoadView = true; //默认要加载网络
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userchange:) name:kUserChangeNotification object:nil];
//    _isMonitorUserChange = false;
//
//}
//
//-(void)setup{
//    self.hidesBottomBarWhenPushed = true;
//}
//
//- (void)setCustomNavigationBackButton
//{
//    UINavigationController *navi = self.navigationController;
//    if (navi != nil && navi.viewControllers.count > 1){
//
//        self.navigationItem.leftBarButtonItems = @[self.backButtonItem];
//    }
//
//}
//
////用户改变
//-(void)userchange:(NSNotification *)notification{
//    if (self.isMonitorUserChange){
//        [self userDidChanged];
//    }
//}
//
//-(void)userDidChanged{
//
//    [self showLoadingView];
//}
//
//
//
//
//
//- (UIBarButtonItem *)backButtonItem
//{
//    if (_backButtonItem != nil) {
//        return _backButtonItem;
//    }
//
//    UIButton *button = [[UIButton alloc] init];
//    [button setImage:[[UIImage imageNamed:@"navigationBar_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
////    [button setImage:[[UIImage imageNamed:@"navigationBar_back_high"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
//    button.frame = CGRectMake(0, 0, 40, 40);
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.imageEdgeInsets = UIEdgeInsetsZero;
//    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
//    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)) {
//        button.contentEdgeInsets =UIEdgeInsetsMake(0, 0,0, 0);
//        button.imageEdgeInsets =UIEdgeInsetsMake(0, 0,0, 0);
//    }
//    _backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    return _backButtonItem;
//}
//
//- (void)setBackButtonItem:(UIBarButtonItem *)backButtonItem
//{
//    if (_backButtonItem == backButtonItem) {
//        return;
//    }
//
//    _backButtonItem = backButtonItem;
//    self.navigationItem.leftBarButtonItem = backButtonItem;
//}
//
//-(void)backAction:(id)sender{
//    if (self.navigationController != nil && self.navigationController.viewControllers.count <= 1){
//        [self dismiss:^{
//
//        }];
//    }
//    [self popViewController:nil];
//}
//
//
////错误提示
//-(LXErrorView *)lxErrorView{
//    if (_lxErrorView == nil ) {
//        _lxErrorView = [[LXErrorView alloc] initWithFrame:self.view.bounds];
//        _lxErrorView.delegate = self;
//        [self.view addSubview:_lxErrorView];
//    }
//    return _lxErrorView;
//}
//
//
//-(LXLoadingView *)lxLoadingView{
//    if (_lxLoadingView != nil) {
//        return _lxLoadingView;
//    }
//    _lxLoadingView = [[LXLoadingView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:_lxLoadingView];
//
//    [_lxLoadingView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.bottom.top.equalTo(self.view);
//    }];
//
//    return _lxLoadingView;
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    if (self.isShowLoadView && self.enterCount == 0) {
//        [self showLoadingView];
//    }else if (self.isLoadData && self.enterCount == 0) {
//        [self contentRefresh];
//    }
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleWillAppearNotification:)
//                                                 name:SVProgressHUDWillAppearNotification
//                                               object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleDidApperaNotification:)
//                                                 name:SVProgressHUDDidAppearNotification
//                                               object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleWillDisappearNotification:)
//                                                 name:SVProgressHUDWillDisappearNotification
//                                               object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleDidDisappearNotification:)
//                                                 name:SVProgressHUDDidDisappearNotification
//                                               object:nil];
////    self.navigationController.navigationBarHidden = FALSE;
//
//
//
//
//}
//
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    self.enterCount += 1;
//}
//
//
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:SVProgressHUDWillAppearNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:SVProgressHUDDidAppearNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:SVProgressHUDWillDisappearNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:SVProgressHUDDidDisappearNotification object:nil];
//    [super viewWillDisappear:animated];
//
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [SVProgressHelper dismissHUD];
//    [super viewDidDisappear:animated];
//}



#pragma mark ---------
#pragma makr instance

- (void)contentRefresh
{
    
}


- (void)userExpired
{
    
}


- (void)errorActionHelp
{
    
}

- (void)contentLoadMore
{
    
}



#pragma mark ------
#pragma mark SVProgressHUD Noticication
- (void)handleWillAppearNotification:(NSNotification *)notif
{
   
}

- (void)handleDidApperaNotification:(NSNotification *)notif
{
    
}

- (void)handleWillDisappearNotification:(NSNotification *)notif
{
    
}

- (void)handleDidDisappearNotification:(NSNotification *)notif
{
    
}



#pragma mark -------
#pragma mark  loading

//- (void)showLoadingView
//{
//    [self.view addSubview:self.lxLoadingView];
//    [self.view bringSubviewToFront:self.lxLoadingView];
//    [self.lxErrorView removeFromSuperview];
//    [self.lxLoadingView startLoading];
//    [self contentRefresh];
//}
//
//- (void)hiddenLoadingView
//{
//    [self.lxErrorView removeFromSuperview];
//    [self.lxLoadingView removeFromSuperview];
//    
//}
//
//#pragma mark ----------
//
//- (void)networkErrorNotice
//{
//    if (self.lxErrorView != nil){
//        [self.lxErrorView removeFromSuperview];
//        self.lxErrorView = nil;
//    }
//    
//    [self.view addSubview:self.lxErrorView];
//    [self.view bringSubviewToFront:self.lxErrorView];
//    [self.lxLoadingView removeFromSuperview];
//    
//    self.lxLoadingView = nil;
//}
//
//- (void)removeErrorView
//{
//    [self.lxErrorView removeFromSuperview];
//    
//}
//
//#pragma mark -LXErrorViewDelegate
//
//- (void)LXErrorViewTouch:(LXErrorView *)view
//{
//    [self showLoadingView];
//    [self.lxErrorView removeFromSuperview];
//    
//    
//}
//

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return FALSE;
}

//  是否支持自动转屏
- (BOOL)shouldAutorotate
{
    return true;
}

// 支持哪些转屏方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

// 页面展示的时候默认屏幕方向（当前ViewController必须是通过模态ViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


@end
