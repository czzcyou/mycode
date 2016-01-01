//
//  SFTabBarViewController.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "SFTabBarViewController.h"
#import "SFTabBar.h"

@interface SFTabBarViewController ()

@end

@implementation SFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //tabbar 隐藏只隐藏自带的tabbar 所以这里不可以删除，职能覆盖上去
   // [self.tabBar removeFromSuperview];
    //调用init会自己掉它initwithframe
    SFTabBar *tabBar=[[SFTabBar alloc]init];
    
    
    tabBar.block=^(int  selectedIndex)
    {
        self.selectedIndex=selectedIndex;
        
    };
    
    
    
    tabBar.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    //调用init的时候frame还没有值，所以在调用initwithframe的时候还没有frame值，所以要先通过layoutSubviews来设置按钮的大小
    //设置尺寸之后才能显示
    //tabBar.frame=self.tabBar.frame;
    //如果要用tarbar添加那么只能用bounds来确定位置
    tabBar.frame=self.tabBar.bounds;
    // 如果不删除  那么不能用view来添加
    //而是要用tabbar添加

    //[self.view addSubview:tabBar];
    [self.tabBar addSubview:tabBar];
    
    // 设置导航栏的主题，这里是获取所有的！！导航栏
    UINavigationBar *navBar = [UINavigationBar appearance];
    //navigationBar 设置关于setTranslucent
    

    
//    如果setTranslucent=yes 默认的   则状态栏及导航栏底部为透明的，界面上的组件应该从屏幕顶部开始显示，因为是半透明的，可以看到，所以为了不和状态栏及导航栏重叠，第一个组件的y应该从45的位置算起
//    如果设置成no，则状态栏及导航样不为透明的，界面上的组件就是紧挨着导航栏显示了，所以就不需要让第一个组件在y方向偏离45的高度了
    
    [navBar setTranslucent:NO];
    //[navBar setShadowImage:[UIImage new]];
    //[navBar setBarTintColor:[UIColor greenColor]];
    // 去除导航栏上的分割线
    [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [[UIImage alloc] init];

    [navBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:168/255.0 blue:97/255.0 alpha:1.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
