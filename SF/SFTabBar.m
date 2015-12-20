//
//  SFTabBar.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "SFTabBar.h"
#import "SFTabBarButton.h"

@interface SFTabBar()
@property  (nonatomic,weak)UIButton *selectedButton;

@end

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
        SFTabBarButton *btn =[SFTabBarButton buttonWithType:UIButtonTypeCustom];
        //注意绑定角标，不然不能调用
        
        btn.tag=i;
        //这个添加按钮的事情时在上面init完成的，但是上面方法调用的时候还没有frame，所以要在下面先调用layoutSubviews对按钮大小进行预先赋值
        // 设置按钮的图片
        //按钮的四种状态：选中，高亮，不能用，normal，其中selected和不能要自己设置
        imageName = [NSString stringWithFormat:@"%@",[tabBarItemImages objectAtIndex:i]];
        
        selImageName =[NSString stringWithFormat:@"%@_active",[tabBarItemImages objectAtIndex:i]];
        
        
      //  [btn setBackgroundImage:[UIImage imageNamed:imageName] forState: UIControlStateNormal];
       
       // [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        // 设置背景图片和设置图片的区别
        [btn setImage:[UIImage imageNamed:imageName] forState: UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        
        
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0/255.0 green:168/255.0 blue:97/255.0 alpha:1] forState:UIControlStateSelected];
        
      //  btn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, -5, 0);
       // btn.titleLabel.font=[UIFont systemFontOfSize:10];
       // btn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, -25, 41);
        //[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //按下就选中了
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        //设置第一个默认被选中
        if (i==0) {
            [self btnClick:btn];
        }
        
    }
}


-(void)btnClick:(UIButton *)button
{
    //只有中间这句的话那么一旦选中就会一直选中
    _selectedButton.selected=NO;
    button.selected=YES;
    _selectedButton=button;
    //block的原理和代理类似,这里调用。别的地方实现
    //首先要判断block有没有实现。
    if (_block) {
        _block(button.tag);
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
