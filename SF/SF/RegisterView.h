//
//  RegisterView.h
//  SF
//
//  Created by CYZ on 16/1/11.
//  Copyright © 2016年 CYZ. All rights reserved.
//
//也许这样做的目的是为了把使得controller不那么臃肿
#import <UIKit/UIKit.h>
typedef void(^RegisterViewClickBlock)(NSString *name, NSString *email, NSString *password);
@interface ZZRegisterView : UIView
- (instancetype)initWithFrame:(CGRect)frame withRegisterViewClickBlock:(RegisterViewClickBlock)block;
@end
