//
//  TabBar.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "TabBar.h"
#import "TabBarButton.h"   

@interface TabBar ()

@property(nonatomic,strong) TabBarButton *selButton;
@property(nonatomic,strong) UIImageView *imgView;

@end

@implementation TabBar

- (void)addImageView
{
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@""];
    self.imgView = imgView;
    [self addSubview:imgView];
}

#pragma mark - /************************* 通过传入数据赋值图片 ***************************/
- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title
{
    TabBarButton *btn = [[TabBarButton alloc]init];
    
    [btn setImage:[UIImage imageNamed:nor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:dis] forState:UIControlStateDisabled];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:127/255.0 green:127/127.0 blue:127/255.0 alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0/255.0 green:168/255.0 blue:97/255.0 alpha:1] forState:UIControlStateDisabled];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    // 让第一个按钮默认为选中状态
    if (self.subviews.count == 2) {
        btn.tag = 1;
        [self btnClick:btn];
    }
}

- (void)btnClick:(TabBarButton *)btn
{
    
    // 响应代理方法 实现页面跳转
    if ([self.delegate respondsToSelector:@selector(ChangSelIndexForm:to:)]) {
        [self.delegate ChangSelIndexForm:_selButton.tag to:btn.tag];
    }
    
    // 设置按钮显示状态 并切换选中按钮
    _selButton.enabled = YES;
    _selButton = btn;
    btn.enabled = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
