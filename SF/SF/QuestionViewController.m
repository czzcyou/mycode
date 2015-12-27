//
//  QuestionViewController.m
//  SF
//
//  Created by CYZ on 15/11/30.
//  Copyright © 2015年 CYZ. All rights reserved.
//



/////////
#import "QuestionDetailViewController.h"
#import "AskViewController.h"
#import "QuestionViewController.h"
#import "HMSegmentedControl.h"
#import "NewestViewController.h"
#import "HottestViewController.h"
#import "UnanswerViewController.h"
#import "NewestViewController.h"
#import "MacroDefinition.h" 
#import "EXTScope.h"

@interface QuestionViewController ()<UIScrollViewDelegate,NewestViewControllerDelegate>

@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@property (nonatomic, strong) UIScrollView *helperScrollView;

@property (nonatomic, strong) NewestViewController *newestViewController;
@property (nonatomic, strong) HottestViewController *hottestViewController;
@property (nonatomic, strong) UnanswerViewController *UnanswerViewController;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"最新的", @"热门的", @"未回答"]];
    //这里之所以要设置为0，0是因为segmentedControl当作tableview的子view
    segmentedControl.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);
    
    
    
    //对最新的、未回答那三个标题进行字体和光标大小进行设置
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
//设置选项光标上面横线的颜色
    segmentedControl.selectionIndicatorColor = kMainColor;
    //设置选项光标上面横线的粗细
    segmentedControl.selectionIndicatorHeight = 2;
    //  设置光标被三个选项评分；
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
  //设置选中选项的字体颜色和大小
    segmentedControl.selectedTitleTextAttributes = @{UITextAttributeTextColor:kMainColor,UITextAttributeFont:[UIFont systemFontOfSize:15]};
   
 //这里为未选中的
    segmentedControl.titleTextAttributes = @{UITextAttributeTextColor:UIColorFromRGB(0x595959),UITextAttributeFont:[UIFont systemFontOfSize:15]};
    
    segmentedControl.backgroundColor = UIColorFromRGB(0xf3f3f3);
    self.segmentedControl = segmentedControl;
    
    
    
    
    
    
    //没有这个在标签切换中显示不出来，以navigation作为容器就必须这样
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self.view addSubview:segmentedControl];
    [segmentedControl setIndexChangeBlock:^(NSInteger index) {
        CGPoint point = CGPointMake(index * self.view.bounds.size.width, 0);
        self.helperScrollView.delegate = nil;
        [self.helperScrollView setContentOffset:point animated:NO];
        self.helperScrollView.delegate = self;
    }];
    
    self.helperScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, segmentedControl.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - segmentedControl.frame.size.height - 49 )];
    [self.view addSubview:self.helperScrollView];
    self.helperScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height - segmentedControl.frame.size.height - 65 );
    self.helperScrollView.pagingEnabled = YES;
    self.helperScrollView.delegate = self;
    [self.view addSubview:self.helperScrollView];
    
    
    NewestViewController *newestViewController = [[NewestViewController alloc] init];
    newestViewController.view.frame = CGRectMake(0, 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height);
    
    
   newestViewController.delegate=self;
    
    
    newestViewController.tableView.frame = newestViewController.view.bounds;
    
    
    self.newestViewController = newestViewController;
    [self.helperScrollView addSubview:newestViewController.view];
    
    HottestViewController *hottesetViewController = [[HottestViewController alloc] init];
    hottesetViewController.view.frame = CGRectMake(CGRectGetMaxX(newestViewController.view.frame), 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height);
    self.hottestViewController = hottesetViewController;
    [self.helperScrollView addSubview:hottesetViewController.view];
    
    
    UnanswerViewController *unAnswerViewController = [[UnanswerViewController alloc] init];
    unAnswerViewController.view.frame = CGRectMake(CGRectGetMaxX(hottesetViewController.view.frame), 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height);
    self.UnanswerViewController = unAnswerViewController;
    [self.helperScrollView addSubview:unAnswerViewController.view];
    


    UIButton *askButton = [UIButton buttonWithType:UIButtonTypeCustom];
    askButton.backgroundColor = [UIColor clearColor];
    [askButton setTitle:@"提问" forState:UIControlStateNormal];
    askButton.titleLabel.font = [UIFont systemFontOfSize:17];
    askButton.frame = CGRectMake(0, 0, 35, 17);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:askButton];
    [askButton addTarget:self action:@selector(askButtonDidPressed) forControlEvents:UIControlEventTouchUpInside];
    
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


- (void)askButtonDidPressed{
    AskViewController *askViewController = [[AskViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:askViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
     askViewController.title=@"提问";
    
    
    //跳进去如何跳出来是个问题
    
}

- (void)newestViewController:(NewestViewController *)newestViewController
    didPressedWithQuestionId:(NSString *)questionid{
    if (questionid.length == 0) {
        return;
    }
    
    QuestionDetailViewController *questionDetailViewController = [[QuestionDetailViewController alloc] initWithQuestionId:questionid];
    
    [self.navigationController pushViewController:questionDetailViewController animated:NO];
   
    
    
    
    
    
    
}
    
    

@end
