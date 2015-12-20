//
//  SFTabBarButton.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "SFTabBarButton.h"

@implementation SFTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
[super layoutSubviews];
//按钮的大小和tabBar是有关系的
CGFloat btnW=self.bounds.size.width / self.subviews.count;
CGFloat btnH=self.bounds.size.height;
//不确定就直接设置为0
CGFloat btnX=0;
//
CGFloat btnY=0;


//设置按钮的尺寸
for (int i=0; i<self.subviews.count; i++) {
    UIButton * btn = self.subviews[i];
    btnX =i * btnW;
    btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    //    self.titleLabel.x = self.imageView.x;
    CGFloat imageX=(self.frame.size.width-self.imageView.frame.size.width)/2;
    self.imageView.frame=CGRectMake(imageX, 5, 25, 25);
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    
}

@end
