//
//  LXMainTabbarController.h
//  lexiwed2
//
//  Created by Kyle on 2017/6/7.
//  Copyright © 2017年 乐喜网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXMainTabbarController : UITabBarController

@property (nonatomic,assign) BOOL isLoginRegist;
@property (nonatomic, assign)BOOL isUpdate;
+(instancetype) shareInstance;

-(void)checkIfNeedLogin;
@end
