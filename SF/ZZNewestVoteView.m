//
//  ZZNewest.m
//  MIX
//  54 * 60  ---27 * 30
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZNewestVoteView.h"


@interface ZZNewestVoteView ()
@property (nonatomic, strong) UILabel *voteNumberLabel;
/**
 *  有两种状态文案，回答或者解决
 */
@property (nonatomic, strong) UILabel *voteStatusLabel;
@end



@implementation ZZNewestVoteView

+ (ZZNewestVoteView *)voteView{
    ZZNewestVoteView *voteView = [[ZZNewestVoteView alloc] initWithFrame:CGRectMake(0, 0, 27, 30)];
    voteView.backgroundColor = [UIColor clearColor];
    voteView.layer.cornerRadius = 2;
    
    voteView.voteNumberLabel = [[UILabel alloc] init];
    return voteView;
}

- (void)updateWithReviews:(NSString *)reviews unAnwsered:(BOOL)unAnwsered isAccepted:(BOOL)isAccepted{
    
    // 投票数目
    self.voteStatusLabel.text = reviews;
    
    
    

    
    
}


@end
