//
//  LoginThirdPartView.h
//  SF
//
//  Created by CYZ on 16/1/12.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LoginThirdPartViewType) {
    LoginThirdPartViewTypeGoogle,
    LoginThirdPartViewTypeSina,
    LoginThirdPartViewTypeGithub,
    LoginThirdPartViewTypeQQ,
    LoginThirdPartViewTypeWeChat
};
typedef void(^LoginThirdPartViewBlock)(LoginThirdPartViewType type);

@interface LoginThirdPartView : UIView
- (instancetype)initWithFrame:(CGRect)frame thirdPartyIconDidPressedblock:(LoginThirdPartViewBlock)block;
@end

