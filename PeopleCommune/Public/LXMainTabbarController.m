//
//  LXMainTabbarController.m
//  lexiwed2
//
//  Created by Kyle on 2017/6/7.
//  Copyright © 2017年 乐喜网. All rights reserved.
//

#import "LXMainTabbarController.h"
#import "UIWindow+Helper.h"
#import "PCLoginViewController.h"

//#import "UserDefault.h"
//#import "LXUserManager.h"

@interface LXMainTabbarController ()

//@property (nonatomic, strong) LXMerchantHomeViewController *merchantHomeVC;
@property (nonatomic, strong) NSMutableArray *controllers;

@end

@implementation LXMainTabbarController

static LXMainTabbarController* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    }) ;

    return _instance ;
}

- (void)dealloc
{
    NSLog(@"LXMainTabbarController 释放内存");
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(instancetype)init{
    return [self initWithNibName:nil bundle:nil];
}


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.delegate = self;

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityOwnChanged:) name:kLiveChangedNotification object:nil];

    self.tabBar.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];

    [self.tabBar setShadowImage:[[UIImage alloc]init]];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];

    [self crateSubViewControllers];
    [self createSystemTabbar];

    NSArray * fontArrays = [[UIFont familyNames] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1 = (NSString *)obj1;
        NSString *str2 = (NSString *)obj2;
        return [str1 compare:str2];
    }];
    for(NSString *fontfamilyname in fontArrays)
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

//    if ([LXUserManager shareInstance].allNeedLogin){
//        [self checkIfNeedLogin];
//    }

}

-(NSMutableArray *)controllers{
    if (_controllers != nil){
        return _controllers;
    }
    _controllers = [NSMutableArray arrayWithCapacity:0];
    return _controllers;
}


-(void)crateSubViewControllers{
//
   PCLoginViewController *homeVC = [[PCLoginViewController alloc]init];
    UINavigationController *merchantNavi = [[UINavigationController alloc] initWithRootViewController:homeVC];
    [self.controllers addObject:homeVC];


    PCLoginViewController *ownVC = [[PCLoginViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *ownNavi = [[UINavigationController alloc] initWithRootViewController:ownVC];
    [self.controllers addObject:ownNavi];

    UIViewController *liveVC = [[PCLoginViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *liveNavi = [[UINavigationController alloc] initWithRootViewController:liveVC];
    [self.controllers addObject:liveNavi];


    UIViewController *toolsVC = [[PCLoginViewController alloc] init];
    UINavigationController *toolsNavi = [[UINavigationController alloc] initWithRootViewController:toolsVC];
    [self.controllers addObject:toolsNavi];

    UIViewController *myVC = [[PCLoginViewController alloc] init];
    UINavigationController *myNavi = [[UINavigationController alloc] initWithRootViewController:myVC];
    [self.controllers addObject:myNavi];
    
//    PCLoginViewController *loginVC = [PCLoginViewController new];
//    [self.controllers addObject:loginVC];
//    [self.controllers addObject:loginVC];
    //测试
    self.viewControllers = self.controllers;

    self.selectedIndex = 0;
}




-(void)reloadSubViewController{

    if (self.controllers.count == 0){
        return;
    }

    self.controllers = [NSMutableArray arrayWithArray:self.controllers];

//        UIViewController *liveVC = [[LXLiveHomePageViewController alloc] initWithNibName:nil bundle:nil];
//        UINavigationController *liveNavi = [[ESNavigationController alloc] initWithRootViewController:liveVC];
//       [self.controllers replaceObjectAtIndex:2 withObject:liveNavi];

    self.viewControllers = self.controllers;

}



- (void)createSystemTabbar
{
    //1.设置背景图片

    CGFloat r = 255.0 / 255;
    CGFloat g = 255.0 / 255;
    CGFloat b = 255.0 / 255;

    self.tabBar.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];

    //去除标签栏的顶部分割线
    [self.tabBar setShadowImage:[[UIImage alloc]init]];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];

    //2.创建按钮图片及标题数组
    NSMutableArray *imgNameNor = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *imgNameSel = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *titleName = [NSMutableArray arrayWithCapacity:0];

    [imgNameNor addObject:@"tabbar_home_normal"];
    [imgNameSel addObject:@"tabbar_home_selecte"];
    [titleName addObject:@"主页"];

    [imgNameNor addObject:@"tabbar_own_normal"];
    [imgNameSel addObject:@"tabbar_own_selecte"];

//    BOOL isOwn = [UserDefault BoolValueForKey:kLocationCityZiying];
//    if (isOwn) {
//        [titleName addObject:@"直营婚庆"];
//    }else{
        [titleName addObject:@"现货"];//直营
//    }


    [imgNameNor addObject:@"tabbar_live_normal"];
    [imgNameSel addObject:@"tabbar_tool_selecte"];
    [titleName addObject:@"行情"];

    [imgNameNor addObject:@"tabbar_tool_normal"];
    [imgNameSel addObject:@"tabbar_tool_selecte"];
    [titleName addObject:@"财务"];

    [imgNameNor addObject:@"tabbar_uercenter_normal"];
    [imgNameSel addObject:@"tabbar_uercenter_selecte"];
    [titleName addObject:@"我的"];

    for (NSInteger i = 0; i<self.controllers.count; i++) {
        UIViewController *vc = self.controllers[i];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleName[i] image:[[UIImage imageNamed:imgNameNor[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:imgNameSel[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0],NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0],NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    }

}


#pragma mark
#pragma mark 登录

-(void)checkIfNeedLogin{

    UIViewController *topViewController = [UIWindow lx_topMostController];
    if (topViewController == nil){
        return ;
    }
////登录转态判断 以后可能要用
//    if (![LXUserManager shareInstance].isLogined){
//
//        LXLoginViewController *login = [[LXLoginViewController alloc]init];
//        ESNavigationController *navi = [[ESNavigationController alloc] initWithRootViewController:login];
//        [topViewController presentViewController:navi animated:YES completion:nil];
//        return;
//
//    }
}

#pragma mark---HttpCallBack
-(UIStatusBarStyle)preferredStatusBarStyle{
    UIViewController *subViewController = self.viewControllers[self.selectedIndex];
    return [subViewController preferredStatusBarStyle];
}

-(BOOL)prefersStatusBarHidden
{
    UIViewController *subViewController = self.viewControllers[self.selectedIndex];
    return [subViewController prefersStatusBarHidden];
}



//  是否支持自动转屏
- (BOOL)shouldAutorotate
{
    // 调用ZFPlayerSingleton单例记录播放状态是否锁定屏幕方向
    UIViewController *subViewController = self.viewControllers[self.selectedIndex];
    return [subViewController shouldAutorotate];
}

// 支持哪些转屏方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UIViewController *subViewController = self.viewControllers[self.selectedIndex];
    return [subViewController supportedInterfaceOrientations];
}

// 页面展示的时候默认屏幕方向（当前ViewController必须是通过模态ViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    UIViewController *subViewController = self.viewControllers[self.selectedIndex];
    return [subViewController preferredInterfaceOrientationForPresentation];
}


-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    if (viewController == self.controllers[4]){
//
//       if (![LXUserManager shareInstance].isLogined){
//
//           UIViewController *topViewController = [UIWindow lx_topMostController];
//           if (topViewController != nil){
//               LXLoginViewController *login = [[LXLoginViewController alloc]init];
//               login.loginSuccess = ^(BOOL result) {
//                   if (result){
//                       self.selectedIndex = 4;
//                   }
//               };
//               ESNavigationController *navi = [[ESNavigationController alloc] initWithRootViewController:login];
//               [topViewController presentViewController:navi animated:YES completion:nil];
//           }
//           return false;
//
//       }else{
//           return true;
//       }
//
//    }
    return true;
}

@end
