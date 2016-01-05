//
//  RankView.m
//  SF
//
//  Created by CYZ on 16/1/4.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import "RankView.h"



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@interface  RankView()
// 点赞数
@property (nonatomic, strong) UILabel *likeCountLabel;
// 勋章数
@property (nonatomic, strong) UILabel *honorCountLabel;
// 声望值
@property (nonatomic, strong) UILabel *reputationCountLabel;
@end

@implementation RankView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    }
    return self;
}


- (void)configureSubviews {
    
    self.likeCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, [UIScreen mainScreen].bounds.size.width/ 3, 16)];
    self.likeCountLabel.font = [UIFont systemFontOfSize:16];
    self.likeCountLabel.textAlignment = NSTextAlignmentCenter;
    self.likeCountLabel.backgroundColor = [UIColor clearColor];
    self.likeCountLabel.textColor = [UIColor whiteColor];
    self.likeCountLabel.text = @"0";
    [self addSubview:self.likeCountLabel];
    UILabel *likeTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.likeCountLabel.frame.origin.y + self.likeCountLabel.frame.size.height + 10, self.frame.size.width / 3, 15)];
    
    likeTipLabel.font = [UIFont systemFontOfSize:15];
    likeTipLabel.textAlignment = NSTextAlignmentCenter;
    likeTipLabel.backgroundColor = [UIColor clearColor];
    likeTipLabel.textColor = [UIColor whiteColor];
    
    likeTipLabel.text = @"次被赞";
    [self addSubview:likeTipLabel];
    
    self.honorCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.likeCountLabel.frame.size.width, 16, [UIScreen mainScreen].bounds.size.width/3, 16)];
    self.honorCountLabel.font = [UIFont systemFontOfSize:16];
    self.honorCountLabel.textAlignment = NSTextAlignmentCenter;
    self.honorCountLabel.backgroundColor = [UIColor clearColor];
    self.honorCountLabel.textColor = [UIColor whiteColor];
    self.honorCountLabel.text = @"0";
    [self addSubview:self.honorCountLabel];
    
    UILabel *honorTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.honorCountLabel.frame.origin.x,self.honorCountLabel.frame.origin.y+ self.honorCountLabel.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width/3, 15)];
    
    honorTipLabel.font = [UIFont systemFontOfSize:15];
    honorTipLabel.textAlignment = NSTextAlignmentCenter;
    honorTipLabel.backgroundColor = [UIColor clearColor];
    honorTipLabel.textColor = [UIColor whiteColor];
    honorTipLabel.text = @"枚勋章";
    [self addSubview:honorTipLabel];
    
    self.reputationCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.honorCountLabel.frame.origin.x+self.honorCountLabel.frame.size.width, 16, [UIScreen mainScreen].bounds.size.width/3, 16)];
    self.reputationCountLabel.font = [UIFont systemFontOfSize:16];
    self.reputationCountLabel.textAlignment = NSTextAlignmentCenter;
    self.reputationCountLabel.backgroundColor = [UIColor clearColor];
    self.reputationCountLabel.textColor = [UIColor whiteColor];
    self.reputationCountLabel.text = @"0";
    [self addSubview:self.reputationCountLabel];
    
    
    UILabel *reputationTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.reputationCountLabel.frame.origin.x,self.reputationCountLabel.frame.origin.y+self.reputationCountLabel.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width/3, 15)];
    reputationTipLabel.font = [UIFont systemFontOfSize:15];
    reputationTipLabel.textAlignment = NSTextAlignmentCenter;
    reputationTipLabel.backgroundColor = [UIColor clearColor];
    reputationTipLabel.textColor = [UIColor whiteColor];
    reputationTipLabel.text = @"声望值";
    [self addSubview:reputationTipLabel];
}

- (void)updateLikeCount:(NSString *)like
             honorCount:(NSString *)honor
        reputationCount:(NSString *)reputation {
    self.likeCountLabel.text = like;
    self.honorCountLabel.text = honor;
    self.reputationCountLabel.text = reputation;
}

@end


