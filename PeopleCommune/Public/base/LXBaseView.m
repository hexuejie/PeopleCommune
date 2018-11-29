
//
//  LXBaseView.m
//  lexiwed2
//
//  Created by Kyle on 2017/3/22.
//  Copyright © 2017年 乐喜网. All rights reserved.
//

#import "LXBaseView.h"

@interface LXBaseView()

@end

@implementation LXBaseView


-(id)init{
    
    return [self initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}


-(void)setup{
    
}

@end
