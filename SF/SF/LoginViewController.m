//
//  LoginViewController.m
//  SF
//
//  Created by CYZ on 16/1/1.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginInputViewController.h"
#import "MacroDefinition.h"
#import "ZZHttpClient.h"
#import "EXTScope.h"

#import "Configuration.h"

@interface LoginViewController ()

@property (nonatomic, copy) FinishLoginBlock finishLoginBlock;

@property (nonatomic, strong) UIScrollView *backgroundScrollView;
@property (nonatomic, strong) UILabel *loginTipLabel;
@property (nonatomic, strong) LoginInputViewController *loginInputView;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *retrivePasswordButton;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LoginViewController

- (instancetype)initWithFinishLogin:(FinishLoginBlock)finishLoginBlock {
    self = [super init];
    if (self) {
        self.finishLoginBlock = finishLoginBlock;
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorFromRGB(0xefeff4);
    //[self configureTitles:@"登录"];
    [self configureSubViews];
    [self configureLeftBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)configureSubViews{
    
    // scrollView
    self.backgroundScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 160);
    self.backgroundScrollView.bounces = YES;
  //  [self.backgroundScrollView addSubview:self.loginInputView];
    
    // 登录按钮
//self.loginButton.frame = CGRectMake(0, CGRectGetMaxY(_loginInputView.frame) + 16, 346, 45);
    self.loginButton.center = CGPointMake(self.view.bounds.size.width * 0.5, _loginButton.center.y);
    [self.backgroundScrollView addSubview:self.loginButton];
    
    // 提示文案
    self.loginTipLabel.frame = CGRectMake(0, 122, self.view.bounds.size.width, 15);
    [self.backgroundScrollView addSubview:self.loginTipLabel];
    
    // 注册按钮
    self.registerButton.frame = CGRectMake(74, CGRectGetMaxY(self.loginButton.frame) + 50, 60, 15);
    [self.backgroundScrollView addSubview:self.registerButton];
    
    
}

- (void)configureLeftBarItem {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}


- (void)buttonDidPressed:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

#pragma mark - target action
- (void)loginButtonDidPressed:(UIButton *)button {
  //  [self showLoading];
    @weakify(self);
//   // [[HttpClient sharedHTTPClient] requestLoginWithName:_loginInputView.emailText password:_loginInputView.passwordText SuccessBlock:^(id data) {
// //       @strongify(self);
// //       [self hideLoading];
// //       ZZLoginModel *loginModel = [[ZZLoginModel alloc] initWithDictionary:data error:nil];
//   //     if (loginModel.status == 0) {
//            [ZZConfiguration sharedConfigration].token = loginModel.token;
//            [ZZConfiguration sharedConfigration].userID = loginModel.user.userID;
//            [self dismissViewControllerAnimated:YES completion:nil];
//            if (self.finishLoginBlock) {
//                self.finishLoginBlock();
//            }
//        }else {
//            NSString *errorMessage = loginModel.mobile.error;
//            [self showText:errorMessage];
//            
//        }
//    } failBlock:^(id error) {
//        @strongify(self);
//        [self hideLoading];
//        [self showText:@"服务器或网络异常,请重试"];
//    }];
    
}

- (void)registerButtonDidPressed:(UIButton *)button {
//    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:registerViewController];
//    [self presentViewController:navigationController animated:YES completion:nil];
    
}

#pragma mark - setter and getter

- (UIScrollView *)backgroundScrollView{
    if (_backgroundScrollView == nil) {
        _backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.
                                 bounds];
        
        [self.view addSubview:_backgroundScrollView];
    }
    return _backgroundScrollView;
}


- (LoginInputViewController *)loginInputView {
//    if (_loginInputView == nil) {
//        _loginInputView = [[LoginInputViewController alloc] initWithFrame:CGRectMake(0, 169, [UIScreen mainScreen].bounds.size.width, 100)];
//    }
 //  return  _loginInputView;
    return _loginInputView ;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.layer.cornerRadius = 4;
        _loginButton.backgroundColor = kMainColor;
    }
    return _loginButton;
    
}

- (UILabel *)loginTipLabel {
    if (_loginTipLabel == nil) {
        _loginTipLabel = [[UILabel alloc] init];
        _loginTipLabel.text = @"或者本站账号登录";
        _loginTipLabel.font = [UIFont systemFontOfSize:15];
        _loginTipLabel.textAlignment = NSTextAlignmentCenter;
        _loginTipLabel.textColor = UIColorFromRGB(0x757575);
        
    }
    return _loginTipLabel;
}

- (UIButton *)registerButton{
    if (_registerButton == nil) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _registerButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_registerButton addTarget:self action:@selector(registerButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitleColor:UIColorFromRGB(0xa4a4a4) forState:UIControlStateNormal];
        
    }
    return _registerButton;
    
}

@end