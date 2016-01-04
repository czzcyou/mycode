//
//  RankView.h
//  SF
//
//  Created by CYZ on 16/1/4.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankView : UIView

- (void)updateLikeCount:(NSString *)like
             honorCount:(NSString *)honor
        reputationCount:(NSString *)reputation;

@end
