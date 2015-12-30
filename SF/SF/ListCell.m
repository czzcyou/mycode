//
//  ListCell.m
//  SF
//
//  Created by CYZ on 15/12/28.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "ListCell.h"


@interface ListCell ()
@property (nonatomic, strong) UILabel *numLabel;
@end

@implementation ListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self configureSubViews];
    return self;
}


- (void)configureSubViews {
    CGRect rect = CGRectMake(330, 0, 18, self.bounds.size.height);
    self.numLabel = [[UILabel alloc] initWithFrame:rect];
    self.numLabel.backgroundColor = [UIColor clearColor];
}

- (void)configureNumber:(NSString *)number {
    self.numLabel.text = number;
}

@end
