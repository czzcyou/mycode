//
//  SFTabBarButton.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "SFTabBarButton.h"

@implementation SFTabBarButton

-(void)setHighlighted:(BOOL)highlighted
{
    //取消高亮状态
   // return [super setHighlighted:highlighted];
}
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
/* CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
 
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;s
*/
    CGRect frame = self.imageView.frame;
    frame.origin.y= 5;
    frame.size.width=25;
    frame.size.height=25;
    frame.origin.x=(self.frame.size.width-self.imageView.frame.size.width)/2.0;
    self.imageView.frame=frame;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGRect frame1 = self.titleLabel.frame;
    frame1.origin.x=self.imageView.frame.origin.x-(self.titleLabel.frame.size.width-self.imageView.frame.size.width )/2.0;
    frame1.origin.y=CGRectGetMaxY(self.imageView.frame)+2;
    self.titleLabel.frame=frame1;
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}




@end
