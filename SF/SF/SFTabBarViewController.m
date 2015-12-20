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
    
    [self.tabBar removeFromSuperview];
    //调用init会自己掉它initwithframe
    SFTabBar *tabBar=[[SFTabBar alloc]init];
    tabBar.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    //调用init的时候frame还没有值，所以在调用initwithframe的时候还没有frame值，所以要先通过layoutSubviews来设置按钮的大小
    //设置尺寸之后才能显示
    tabBar.frame=self.tabBar.frame;
    //
    [self.view addSubview:tabBar];
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
