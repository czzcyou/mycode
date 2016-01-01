//
//  LoginViewController.h
//  SF
//
//  Created by CYZ on 16/1/1.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^FinishLoginBlock)();
@interface LoginViewController : UIViewController
- (instancetype)initWithFinishLogin:(FinishLoginBlock)finishLoginBlock;
@end
