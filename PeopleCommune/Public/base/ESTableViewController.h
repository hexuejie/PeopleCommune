//
//  ESTableViewController.h
//  eShop
//
//  Created by Kyle on 14-10-13.
//  Copyright (c) 2014年 yujiahui. All rights reserved.
//

#import "ESBaseViewController.h"
//#import "NSIndexPath+Key.h"
//#import "LXEmptyNoticeView.h"
#import "UITableView+Extension.h"
#import "LXEnum.h"
#import <MJRefresh/MJRefresh.h>
#import "LXNoDataModel.h"
#import "LXBaseRefreshNormalHeader.h"

@interface ESTableViewController : ESBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView *_tableView;
}

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) UITableViewStyle style;

@property (nonatomic, readonly) UITableView *tableView;

@property (nonatomic, readonly) LXEmptyNoticeView *emptyView;

@property (nonatomic, assign) CGFloat footerHeight; //下拉刷新
@property (nonatomic, assign) LXPullState refreshState; //下拉刷新
@property (nonatomic, assign) LXPullState loadMoreState;//加载更多

@property (nonatomic, assign) LXPullState newRefreshState; //新版下拉刷新
@property (nonatomic, assign) BOOL isShowEmptyNotice;


-(void)headerRefreshEnd;
-(void)footerRefreshEnd;


@end
