//
//  NormalViewCell.m
//  SF
//
//  Created by CYZ on 16/1/5.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import "NormalViewCell.h"
@interface NormalViewCell()
@property (nonatomic, strong) UILabel *numLabel1;
@end

@implementation NormalViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self configureSubViews];
    return self;
}


- (void)configureSubViews {
    CGRect rect = CGRectMake(330, 0, 18, self.bounds.size.height);
    self.numLabel1 = [[UILabel alloc] initWithFrame:rect];
    self.numLabel1.backgroundColor = [UIColor clearColor];
}

- (void)configureOfNumber:(NSString *)number1 {
    self.numLabel1.text = number1;
}
@end
