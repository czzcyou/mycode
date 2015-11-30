//
//  QuestionViewController.m
//  SF
//
//  Created by CYZ on 15/11/30.
//  Copyright © 2015年 CYZ. All rights reserved.
//









/////////

#import "QuestionViewController.h"
#import "HMSegmentedControl.h"

#import "ZZNewestViewController.h"
#import "ZZHottestViewController.h"
#import "ZZunAnsweredViewController.h"

@interface QuestionViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *helperScrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) ZZNewestViewController *newestViewController;
@property (nonatomic, strong) ZZHottestViewController *hottestViewController;
@property (nonatomic, strong) ZZunAnsweredViewController *unAnsweredViewController;


@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"最新的", @"热门的", @"未回答"]];
    
    segmentedControl.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);;

    [self.view addSubview:segmentedControl];
    

    
    
    
    
    


    
   
    
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
