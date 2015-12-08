//
//  NewestViewController.h
//  SF
//
//  Created by CYZ on 15/12/6.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewestViewControllerDelegate;
@interface NewestViewController : UIViewController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<NewestViewControllerDelegate> delegate;
@end


@protocol NewestViewControllerDelegate <NSObject>

- (void)newestViewController:(NewestViewController *)newestViewController
didPressedWithQuestionId:(NSString *)questionid;

@end