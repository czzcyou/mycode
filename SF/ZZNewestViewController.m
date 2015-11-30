//
//  ZZNewestViewController.m
//  MIX
//
//  Created by zhou on 15/11/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZNewestViewController.h"
#import "ZZNewestCell.h"



@interface ZZNewestViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) NSInteger page; //当前所在的分页数


@end

@implementation ZZNewestViewController


- (void)viewDidLoad {
  
}


#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const tableViewReuseIdentifer = @"tableViewReuseIdentifer";
    ZZNewestCell *newestCell = [tableView dequeueReusableCellWithIdentifier:tableViewReuseIdentifer];
    if (newestCell == nil) {
        newestCell = [[ZZNewestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewReuseIdentifer];
    }
    newestCell.textLabel.text = @"测试";
    
    return newestCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}


#pragma mark - custom
- (void)refreshData{



}


- (void)showText:(NSString*)str
{
}


@end
