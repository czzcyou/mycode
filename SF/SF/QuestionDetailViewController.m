//
//  QuestionDetailViewController.m
//  SF
//
//  Created by CYZ on 15/12/8.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "QuestionDetailViewController.h"
#import "ZZHttpClient.h"
#import "EXTScope.h"
#import "ZZQuestionDetailModel.h"
#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>

@interface QuestionDetailViewController ()
@property (nonatomic, copy) NSString *questionId;
@property (nonatomic, strong) UIWebView *contentWebView;


@end

@implementation QuestionDetailViewController
- (instancetype)initWithQuestionId:(NSString *)questionId{
    self = [super init];
    if (self) {
        _questionId = questionId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    //[self configureTitles:@"问题详情"];
    self.navigationItem.title=@"问题详情";
    [self configureWebView];
    [self requestQuestionDetailWithQuestionId:self.questionId];
       
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 配置webview
- (void)configureWebView{
    self.contentWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    // 去白边
    self.contentWebView.backgroundColor = [UIColor redColor];
    for (id v in self.contentWebView.subviews) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)v;
            scrollView.showsVerticalScrollIndicator = NO;
            //            [v setBounces:NO];
            
        }
    }
    
    
    [self.view addSubview:self.contentWebView];
    
    
}

- (void)requestQuestionDetailWithQuestionId:(NSString *)questionId{
    NSString *serviceName = [NSString stringWithFormat:@"question/%@",self.questionId];
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"token"] = @"2b3aa3e88894040e148a7ad740185173";
 //   [self showLoading];
    @weakify(self);
    [[ZZHttpClient sharedHTTPClient] GET:serviceName parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        @strongify(self);
  //      [self hideLoading];
        
        ZZQuestionDetailModel *questionDetailModel = [[ZZQuestionDetailModel alloc] initWithDictionary:responseObject error:nil];
        if (questionDetailModel.status == 0) {
            [self handleQuestionDetailResponseSuccess:questionDetailModel];
        }else{
            [self handleQuestionDetailResponseFailure];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
      //  [self hideLoading];
        [self handleQuestionDetailResponseFailure];
    }];
    
}



// !!!后处理失败的情况
- (void)handleQuestionDetailResponseFailure{
    
    
}


// 处理成功的情况
- (void)handleQuestionDetailResponseSuccess:(ZZQuestionDetailModel *)questionDetailModel{
    ZZQuestionDetailDataModel *questionDetailModelData = questionDetailModel.data;
    [self refreshContentWebView:questionDetailModelData];
}

// 刷新webview
- (void)refreshContentWebView:(ZZQuestionDetailDataModel *)questionDetailModelData{
    NSString *parseTitle = [NSString stringWithFormat:@"<h4>%@</h4>",questionDetailModelData.title];
    NSString *parseNameAndRank = [NSString stringWithFormat:@"<h5>%@ %@ · %@</h5>",questionDetailModelData.user.name,questionDetailModelData.user.rank,questionDetailModelData.createdDate];
    NSString *HTMLString = [NSString stringWithFormat:@"%@%@%@",parseTitle,parseNameAndRank,questionDetailModelData.parsedText];
    
    [self.contentWebView loadHTMLString:HTMLString baseURL:nil];
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
