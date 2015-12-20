//
//  SFTabBar.h
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
//block 的作用：保存一段代码，到恰当的时候再去调用
//如果需要传参数给其他对象，block才需要定义参数
typedef void (^SFTabBarBlock)(int selectedIndex);

@interface SFTabBar : UIView

@property (nonatomic ,copy) SFTabBarBlock block;

@end
