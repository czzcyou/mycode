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

@interface FindViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong)  NSMutableArray *dataSourceArray;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)initData{
//    _dataSourceArray = [[NSMutableArray alloc] init];
//    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
//    [dic1 setObject:@"标签" forKey:@"title"];
//    [dic1 setObject:@"icon_mine_onsite" forKey:@"image"];
//    [dic1 setObject:@"按标签查看感兴趣的内容" forKey:@"detail"];
//    [_dataSourceArray addObject:dic1];
//    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
//    [dic2 setObject:@"排行榜" forKey:@"title"];
//    [dic2 setObject:@"用户最近的贡献榜单" forKey:@"detail"];
//    [dic2 setObject:@"icon_mine_onsite" forKey:@"image"];
// 
    
}

-(void)initViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height )];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   self.tableView.showsVerticalScrollIndicator = YES;
    //是否允许拖动
   self.tableView.bounces = YES;
    
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = UIColorFromRGB(0xefeff4);
   // self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, -1)];
  //  self.tableView.tableHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0,0,5,20)] autorelease];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 30;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 160;
    }else{
        return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        return 60;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, 75)];
    footerView.backgroundColor = [UIColor redColor  ];
    return footerView;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    headerView.backgroundColor =[UIColor greenColor];
    return headerView;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"mineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    
    if (indexPath.section == 1) {
//        cell.textLabel.text = [_dataSourceArray[indexPath.row] objectForKey:@"title"];
//        cell.detailTextLabel.text=[_dataSourceArray[indexPath.row] objectForKey:@"detail"];
       // NSString *imgStr = [_dataSourceArray[indexPath.row] objectForKey:@"image"];
       // cell.imageView.image = [UIImage imageNamed:imgStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
        
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }else{
        cell.textLabel.text = @"我的标题";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

@end
