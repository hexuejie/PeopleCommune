//
//  LXBaseTableHeaderView.h
//  lexiwed2
//
//  Created by Kyle on 2017/4/1.
//  Copyright © 2017年 乐喜网. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXSeparateView;

@interface LXBaseTableHeaderView : UITableViewHeaderFooterView


@property (nonatomic, readonly) LXSeparateView *horizontalLineView;

-(void)setup;


@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, assign) UIEdgeInsets lineEdge;

@end
