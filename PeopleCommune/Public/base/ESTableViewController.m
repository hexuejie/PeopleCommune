//
//  ESTableViewController.m
//  eShop
//
//  Created by Kyle on 14-10-13.
//  Copyright (c) 2014年 yujiahui. All rights reserved.
//

#import "ESTableViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "MerchantRefreshFooter.h"

@interface ESTableViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong) LXEmptyNoticeView *emptyView;

@end

@implementation ESTableViewController
@synthesize tableView = _tableView;



- (void)dealloc
{

}

-(void)setup{
    [super setup];
    self.style = UITableViewStylePlain;
    self.footerHeight = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _refreshState = LXPullStateNO;
    _loadMoreState = LXPullStateNO;

    _isShowEmptyNotice = TRUE;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.top.equalTo(self.view);
    }];
}



#pragma mark ------------
#pragma mark property

-(UITableView *)tableView{
    if (_tableView != nil){
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.scrollsToTop = YES;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.allowsSelection = NO;
    _tableView.allowsSelectionDuringEditing = NO;
    _tableView.estimatedRowHeight = 50;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.backgroundColor = HexRGB(0xf7f7f7);
    _tableView.backgroundView = nil;
    

    _tableView.emptyDataSetSource = self;
    _tableView.emptyDataSetDelegate = self;
 
    return _tableView;
}

-(NSMutableArray *)dataArray{
    if (_dataArray != nil){
        return _dataArray;
    }
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    return _dataArray;
}



-(LXEmptyNoticeView *)emptyView{
    if(_emptyView != nil){
        return _emptyView;
    }
    _emptyView = [[LXEmptyNoticeView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _emptyView.backgroundColor = LSSeparateColor;
    _emptyView.userInteractionEnabled = YES;
    return _emptyView;
}


-(void)setRefreshState:(LXPullState)refreshState{
    
    _refreshState = refreshState;
     __weak typeof(self) weakSelf = self;
    if (_refreshState == LXPullStateNO){
        self.tableView.mj_header = nil;
    }else if(_refreshState == LXPullStateIdle){
        if (self.tableView.mj_header == nil){
            MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
                [weakSelf contentRefresh];
            }];
            NSArray *idleRefreshArr = @[[UIImage imageNamed:@"refresh0"]];
            NSArray *refreshArr = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"refresh0"],
                                   [UIImage imageNamed:@"refresh1"],
                                   [UIImage imageNamed:@"refresh2"],
                                   [UIImage imageNamed:@"refresh3"],
                                   [UIImage imageNamed:@"refresh4"],nil];
            [header setImages:idleRefreshArr forState:MJRefreshStateIdle];
            [header setImages:refreshArr duration:0.15 *refreshArr.count forState:MJRefreshStateRefreshing];
            [header setImages:refreshArr duration:0.15 *refreshArr.count forState:MJRefreshStatePulling];
            
            header.lastUpdatedTimeLabel.hidden = YES;
            
            // 隐藏状态
            header.stateLabel.hidden = YES;
            self.tableView.mj_header = header;
        }
        self.tableView.mj_header.state = MJRefreshStateIdle;
    }
}

- (void)setNewRefreshState:(LXPullState)newRefreshState{
    
    _newRefreshState = newRefreshState;
    __weak typeof(self) weakSelf = self;
    if (_newRefreshState == LXPullStateNO){
        self.tableView.mj_header = nil;
    }else if(_newRefreshState == LXPullStateIdle){
        if (self.tableView.mj_header == nil){
            
            LXBaseRefreshNormalHeader *header = [LXBaseRefreshNormalHeader headerWithRefreshingBlock:^{
                [weakSelf contentRefresh];
            }];
            [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
            [header setTitle:@"加载中 " forState:MJRefreshStateRefreshing];
            [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
            header.arrowView.image = [UIImage imageNamed:@"refresh_down"];
            header.stateLabel.font = [UIFont fontWithName:@"PingFang-SC-Light" size:10];
            header.stateLabel.textColor = HexRGB(0xb1b1b1);
            header.lastUpdatedTimeLabel.hidden = YES;
            header.labelLeftInset = 10;
            self.tableView.mj_header = header;
        }
        self.tableView.mj_header.state = MJRefreshStateIdle;
    }
}

-(void)setLoadMoreState:(LXPullState)refreshState{

    _loadMoreState = refreshState;
    __weak typeof(self) weakSelf = self;
    if (_loadMoreState == LXPullStateNO){
        self.tableView.mj_footer = nil;
    }else if(_loadMoreState == LXPullStateIdle){
        if (self.tableView.mj_footer == nil){
            if (self.footerHeight > 0) {
                MerchantRefreshFooter *footer = [MerchantRefreshFooter footerWithRefreshingBlock:^{
                    [weakSelf contentLoadMore];
                }];
                footer.frame = CGRectMake(0, 0, ScreenWidth, self.footerHeight);
                self.tableView.mj_footer = footer;
            }else{
                MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    [weakSelf contentLoadMore];
                }];
                self.tableView.mj_footer = footer;
            }
        }
        self.tableView.mj_footer.state = MJRefreshStateIdle;
        
    }else if(_loadMoreState == LXPullStateNoMoreDate){
        if (self.tableView.mj_footer == nil){
            if (self.footerHeight > 0) {
                MerchantRefreshFooter *footer = [MerchantRefreshFooter footerWithRefreshingBlock:^{
                    [weakSelf contentLoadMore];
                }];
                footer.frame = CGRectMake(0, 0, ScreenWidth, self.footerHeight);
                self.tableView.mj_footer = footer;
            }else{
                self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    [weakSelf contentLoadMore];
                }];
            }
        }
        [self.tableView.mj_footer  endRefreshingWithNoMoreData];
    }
}

-(void)headerRefreshEnd{
    [self.tableView.mj_header endRefreshing];
}
-(void)footerRefreshEnd{
    if(self.tableView.mj_footer.state != MJRefreshStateNoMoreData){
       self.tableView.mj_footer.state = MJRefreshStateIdle;
    }
}


-(BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    return self.isShowEmptyNotice;
}

-(UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView{
    return self.emptyView;
}

-(UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
    return UIColorFromRGB(0xf7f7f7);
}

#pragma mark ------------
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TRUE;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

}

@end
