//
//  TabBar.h
//  SF
//
//  Created by CYZ on 15/12/19.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TabBarDelegate <NSObject>

@optional

- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to;

@end

@interface TabBar : UIView

@property (nonatomic,weak) id<TabBarDelegate> delegate;

- (void)addImageView;
- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title;

@end
