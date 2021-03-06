//
//  profileCell.m
//  SF
//
//  Created by CYZ on 15/12/28.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "profileCell.h"
#import "MacroDefinition.h"
#import "RankView.h"


@interface profileCell ()
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIView *backgroundProfileView;
@property (nonatomic, strong) UIView *rankView;
// 用户名，未登录且未注册时显示默认文案"登录/注册"
@property (nonatomic, strong) UILabel *userNameAndLoginTipLabel;
@end


@implementation profileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = kMainColor;
    [self configureSubviews];
    return self;
}



- (void)configureSubviews{
    CGFloat  kWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 35, self.bounds.size.width, 216)];
    view.backgroundColor = [kMainColor colorWithAlphaComponent:0.5];
    [self.contentView addSubview:view];
    
    
    UIImage *image = [UIImage imageNamed:@"user_avatar"];
    _profileImageView = [[UIImageView alloc] initWithImage:image];
    _profileImageView.frame = CGRectMake(0,30, 60, 60);
    _profileImageView.userInteractionEnabled = YES;
    _profileImageView.center = CGPointMake(kWidth * 0.5, _profileImageView.center.y);
    [self.contentView addSubview:_profileImageView];
    
    CGRect rect = CGRectMake(0, CGRectGetMaxY(_profileImageView.frame) + 20, kWidth, 17);
    _userNameAndLoginTipLabel = [[UILabel alloc] initWithFrame:rect];
    _userNameAndLoginTipLabel.text = @"登录/注册";
    _userNameAndLoginTipLabel.textColor = [UIColor whiteColor];
    _userNameAndLoginTipLabel.font = [UIFont systemFontOfSize:17];
    _userNameAndLoginTipLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_userNameAndLoginTipLabel];
    _rankView = [[RankView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 66)];
    [self.contentView addSubview:_rankView];

    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}




@end
