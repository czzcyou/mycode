//
//  NavViewController.m
//  SF
//
//  Created by CYZ on 15/12/17.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController


+ (void)initialize
{
//    // 设置导航栏的主题
//    UINavigationBar *navBar = [UINavigationBar appearance];
//    //如何设置颜色？？？
//    
//    //[navBar setBarTintColor:[UIColor greenColor]];
//    [navBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:168/255.0 blue:97/255.0 alpha:1.0]];
}





-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed=YES;
    return [super pushViewController:viewController animated:animated ];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
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
