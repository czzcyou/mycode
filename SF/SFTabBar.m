//
//  SFTabBar.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "SFTabBar.h"

@implementation SFTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //添加按钮
        [self addBtns];
        
    }
    return self;
}

-(void) addBtns
{
    
    NSArray *tabBarItemImages = @[@"icon_tab_wenda", @"icon_tab_qa", @"icon_tab_discover", @"icon_tab_search",@"icon_tab_user"];
    NSArray *titles = @[@"问题",@"文章",@"发现",@"搜索",@"我的"];
    NSString * imageName= nil;
    NSString * selImageName= nil;
    
    for (int i =0; i<5 ; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        //这个添加按钮的事情时在上面init完成的，但是上面方法调用的时候还没有frame，所以要在下面先调用layoutSubviews对按钮大小进行预先赋值
        // 设置按钮的图片
        //按钮的四种状态：选中，高亮，不能用，normal，其中selected和不能要自己设置
        imageName = [NSString stringWithFormat:@"%@",[tabBarItemImages objectAtIndex:i]];
        
        selImageName =[NSString stringWithFormat:@"%@_active",[tabBarItemImages objectAtIndex:i]];
        
        CGFloat imageX=(btn.frame.size.width-btn.imageView.frame.size.width)/2;
        btn.imageView.frame=CGRectMake(imageX, 5, 25, 25);
        
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState: UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        
        
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:183/255.0 green:20/255.0 blue:28/255.0 alpha:1] forState:UIControlStateDisabled];
        
        [self addSubview:btn];
        
    }
}


-(void)layoutSubviews
{
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
    
}
@end
