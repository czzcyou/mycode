//
//  ScrollViewCell.m
//  SF
//
//  Created by CYZ on 16/1/5.
//  Copyright © 2016年 CYZ. All rights reserved.
//

#import "ScrollViewCell.h"
#import "MacroDefinition.h" 
#import <SDWebImage/UIImageView+WebCache.h>

#define KImageCount 2
@interface ScrollViewCell()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *ScrollView;
@property (nonatomic, strong) UIPageControl *PageControl;
@end
@implementation ScrollViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  // http://sfault-activity.b0.upaiyun.com/415/443/4154430123-56790eafe012e_big
   // http://sfault-activity.b0.upaiyun.com/315/040/3150407927-56096a5f8ccf2_big
    self.backgroundColor = kMainColor;
    [self configureSubviews];
    self.imageUrls=@[@"https://sfault-activity.b0.upaiyun.com/415/443/4154430123-56790eafe012e_big",@"https://sfault-activity.b0.upaiyun.com/315/040/3150407927-56096a5f8ccf2_big"];
    
    for (int i=0 ; i< KImageCount; i++) {
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.ScrollView.bounds];
        [imageView sd_setImageWithURL:self.imageUrls[i] completed:^(UIImage *image,NSError *error,SDImageCacheType cacheType,NSURL *imageURL){}];
        [self.ScrollView addSubview:imageView];
    }
    
    
    [self.ScrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx,BOOL *stop){
        //ScrollView初始化的时候就会调用这个
         CGRect frame = imageView.frame;
        frame.origin.x=idx * frame.size.width;
        imageView.frame=frame;
     
    }];
    self.PageControl.currentPage=0;
    return self;
}


- (void)configureSubviews{
    CGFloat  kWidth = [UIScreen mainScreen].bounds.size.width;
    if (_ScrollView==nil) {
        _ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 176)];
        _ScrollView.backgroundColor = [kMainColor colorWithAlphaComponent:0.5];
        [self.contentView addSubview:_ScrollView];
        _ScrollView.bounces=NO;
        _ScrollView.showsHorizontalScrollIndicator  = NO;
        _ScrollView.showsVerticalScrollIndicator=NO;
        _ScrollView.pagingEnabled=YES;
        
        _ScrollView.contentSize=CGSizeMake(KImageCount * _ScrollView.bounds.size.width, 0);
        _ScrollView.delegate=self;
        
    }
    if (_PageControl==nil) {
        _PageControl=[[UIPageControl alloc]init];
        _PageControl.numberOfPages=KImageCount;
        CGSize size=[_PageControl sizeForNumberOfPages:KImageCount ];
        _PageControl.bounds=CGRectMake(0, 0, size.width, size.height);
        _PageControl.center=CGPointMake(self.contentView.center.x,186);
        _PageControl.pageIndicatorTintColor=[UIColor redColor];
        _PageControl.currentPageIndicatorTintColor=[UIColor blackColor];
        [self.contentView addSubview:_PageControl];
        //添加监听方法
        [_PageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

-(void )pageChanged:(UIPageControl  *) page
{
    CGFloat x = page.currentPage * self.ScrollView.bounds.size.width;
    [self.ScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.PageControl.currentPage=page;
}

@end
