//
//  FindViewController.m
//  SF
//
//  Created by CYZ on 15/11/30.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "FindViewController.h"
#import "EXTScope.h"
#import "MacroDefinition.h"
#import "ScrollViewCell.h"
#import "NormalViewCell.h"  

#define KImageCount 2

@interface FindViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *settingItems2;

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong)  NSMutableArray *dataSourceArray;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
    self.view.backgroundColor = UIColorFromRGB(0xefeff4);
    //    - (void)configureTitles:(NSString *)titles{
    //    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 36, 18)];
    //    titleLabel.text = titles;
    //    titleLabel.textColor = [UIColor whiteColor];
    //    titleLabel.backgroundColor = [UIColor clearColor];
    //    titleLabel.font = [UIFont systemFontOfSize:18];
    //    self.navigationItem.titleView = titleLabel;
    //    }
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 36, 18)];
    titleLabel.text = @"发现";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
    
   
    [self.tableView reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1 && indexPath.section == 0) {
        return 216;
    }else {
        return 45;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 1) {
        static NSString *imageCellIdentifer = @"imageCellIdentifer";
        ScrollViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:imageCellIdentifer];
        if (cell == nil) {
            cell = [[ScrollViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imageCellIdentifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
        return cell;
    }else {
        static NSString *listCellIdentifer = @"listCellIdentifer";
        NormalViewCell  *cell1 = [tableView dequeueReusableCellWithIdentifier:listCellIdentifer];
        if (cell1 == nil) {
            cell1 = [[NormalViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifer];
            [self configureCell:cell1 indexPath:indexPath];
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        return cell1;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
            return 40;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - private

- (void)configureCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSArray *item = self.settingItems[indexPath.section];
    NSString *text = item[indexPath.row];
    cell.textLabel.text = text;
}

- (void)configureTopLineAtIndexPath:(NSIndexPath *)indexPath AtCell:(UITableViewCell *)cell{
    if (indexPath.row == 0) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
        lineView.backgroundColor = UIColorFromRGB(0xc8c7cc);
        [cell.contentView addSubview:lineView];
        
    }
    
}




//这里是怎么回事
#pragma mark - getter
- (NSArray *)settingItems{
    if (_settingItems2 == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"setting2" ofType:@"plist"];
        _settingItems2 = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _settingItems2;
}



//viewcontroller添加tableview
- (UITableView *)tableView{
    if (_tableView == nil) {
        //   CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100);
        
        //为什么没有减去100就不会有上下两条线出现
        // CGRect rect = CGRectMake(0, 45, self.view.bounds.size.width, self.view.bounds.size.height);
        
        //如果不减100那么不会变成ScroolView
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 22);
        _tableView = [[UITableView alloc] initWithFrame:rect];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = UIColorFromRGB(0xefeff4);
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.bounces = YES;
        [self.view addSubview:_tableView];
        //
        //        UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0., 0, 320, 216)];
        //        head.backgroundColor  =[UIColor colorWithRed:0/255.0 green:168/255.0 blue:97/255.0 alpha:1.0];
        //        _tableView.tableHeaderView=head;
        //
        //        UIImage *image = [UIImage imageNamed:@"user_avatar"];
        //        _profileImageView = [[UIImageView alloc] initWithImage:image];
        //        _profileImageView.frame = CGRectMake(0,30, 60, 60);
        //        _profileImageView.userInteractionEnabled = YES;
        //        _profileImageView.center = CGPointMake(320 * 0.5+50, _profileImageView.center.y);
        //        [head addSubview:_profileImageView];
        //
        //        CGRect rect1 = CGRectMake(50, CGRectGetMaxY(_profileImageView.frame) + 20, 320, 17);
        //        _userNameAndLoginTipLabel = [[UILabel alloc] initWithFrame:rect1];
        //        _userNameAndLoginTipLabel.text = @"登录/注册";
        //        _userNameAndLoginTipLabel.textColor = [UIColor whiteColor];
        //        _userNameAndLoginTipLabel.font = [UIFont systemFontOfSize:17];
        //        _userNameAndLoginTipLabel.textAlignment = NSTextAlignmentCenter;
        //        [head addSubview:_userNameAndLoginTipLabel];
        
        
        
        
    }
    return _tableView;
}



@end
