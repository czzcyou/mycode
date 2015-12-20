//
//  TabBarController.m
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "TabBarController.h"
#import "TabBar.h"
@interface TabBarController ()<TabBarDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    TabBar *tabBar = [[TabBar alloc]init];
    

   // Do any additional setup after loading the view.
  /* TabBar *tabBar = [[TabBar alloc]init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    
   [self.tabBar addSubview:tabBar];
    
   tabBar.delegate = self;
  
    
   [tabBar addImageView];
    
    [tabBar addBarButtonWithNorName:@"icon_tab_wenda" andDisName:@"icon_tab_wenda_active" andTitle:@"问题"];
    [tabBar addBarButtonWithNorName:@"icon_tab_qa" andDisName:@"icon_tab_qa_active" andTitle:@"文章"];
    [tabBar addBarButtonWithNorName:@"icon_tab_discover" andDisName:@"icon_tab_discover_active" andTitle:@"发现"];
    [tabBar addBarButtonWithNorName:@"icon_tab_search" andDisName:@"icon_tab_search_active" andTitle:@"搜索"];
    [tabBar addBarButtonWithNorName:@"icon_tab_user" andDisName:@"icon_tab_user_active" andTitle:@"我的"];
    
    self.selectedIndex = 0;*/
    
    
    

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
