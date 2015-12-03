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


@interface QuestionViewController ()
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;


@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"最新的", @"热门的", @"未回答"]];
    //这里之所以要设置为0，0是因为segmentedControl当作tableview的子view
    segmentedControl.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);
    //没有这个在标签切换中显示不出来，以navigation作为容器就必须这样
    self.edgesForExtendedLayout = UIRectEdgeNone;

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
