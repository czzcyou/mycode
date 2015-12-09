//
//  AskViewController.m
//  SF
//
//  Created by CYZ on 15/12/8.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "AskViewController.h"

@interface AskViewController ()

@end

@implementation AskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonDidPressed) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* AskViewController *askViewController = [[AskViewController alloc] init];
 UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:askViewController];
 [self presentViewController:navigationController animated:YES completion:nil];
 askViewController.title=@"提问";
 
 //navigationcontroller用来管理viewcontroller，每个viewcontroller有一个navigationcontroller属性，当前显示的view对应的viewcontroller就会显示对其navigationcontroller属性用navigationcontroller赋值
*/
- (void)buttonDidPressed{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
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
