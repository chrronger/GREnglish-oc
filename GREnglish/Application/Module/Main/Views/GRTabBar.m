//
//  GRTabBar.m
//  GREnglish
//
//  Created by sen on 16/9/13.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "GRTabBar.h"


@interface GRTabBar ()
{
    UIButton *_addButton;
}

@end

@implementation GRTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:IMAGE(@"tabbar_publish_icon_normal") forState:UIControlStateNormal];
    [_addButton setImage:IMAGE(@"tabbar_publish_icon_selected") forState:UIControlStateHighlighted];

    _addButton.center = CGPointMake((SCREEN_WIDTH-SCREEN_WIDTH/5 )*0.5, self.frame.size.height*0.5-20);
    _addButton.size = CGSizeMake(SCREEN_WIDTH/5, SCREEN_WIDTH/5);
    
    [_addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addButton];
    
}

- (void)addButtonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didAddButtonClick:)]) {
        [self.delegate didAddButtonClick:button];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = SCREEN_WIDTH/5;
    CGFloat height = 49;
    CGFloat y = 0;
    NSInteger idx = 0;
    
    for (UIView *view in self.subviews) {
        //隐藏tab顶部线
        if (![view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if ([view isKindOfClass:NSClassFromString(@"UIImageView")] && view.frame.size.height <= 1) {
                view.hidden = YES;
            }
            continue;
        }
        CGFloat x = (idx > 1 ? idx+1 :idx)*width;
        view.frame = CGRectMake(x, y, width, height);
        idx+= 1;
    }
    
    
}

@end
