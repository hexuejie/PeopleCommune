//
//  LXBaseTableHeaderView.m
//  lexiwed2
//
//  Created by Kyle on 2017/4/1.
//  Copyright © 2017年 乐喜网. All rights reserved.
//

#import "LXBaseTableHeaderView.h"
//#import "LXSeparateView.h"

@interface LXBaseTableHeaderView()

@property (nonatomic, strong) LXSeparateView *horizontalLineView;

@end

@implementation LXBaseTableHeaderView


-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]){
        [self setup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}


-(void)setup{

    _lineHeight = 1;

    _horizontalLineView = [LXSeparateView autolayoutView];
    _horizontalLineView.backgroundColor = UIColorFromRGB(0xF7F7F7);
    [self.contentView addSubview:_horizontalLineView];

    [_horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(_lineHeight);
    }];

}

-(void)setLineHeight:(CGFloat)lineHeight{
    if (_lineHeight == lineHeight){
        return;
    }

    _lineHeight = lineHeight;
//    [self.horizontalLineView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(_lineHeight);
//    }];
}

-(void)setLineEdge:(UIEdgeInsets)lineEdge{
    if (UIEdgeInsetsEqualToEdgeInsets(_lineEdge, lineEdge)){
        return;
    }
    _lineEdge = lineEdge;

//    [self.horizontalLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.contentView.mas_leading).offset(_lineEdge.left);
//        make.trailing.equalTo(self.contentView.mas_trailing).offset(_lineEdge.right);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(_lineEdge.bottom);
//        make.height.mas_equalTo(_lineHeight);
//    }];
}

@end
