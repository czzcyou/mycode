//
//  NewestViewController.m
//  SF
//
//  Created by CYZ on 15/12/6.
//  Copyright © 2015年 CYZ. All rights reserved.
//

#import "NewestViewController.h"
#import "MJRefresh.h"

///////
#import "ZZNewestCell.h"
#import "ZZHttpClient.h"
#import "MJRefresh.h"
#import "ZZNewestListModel.h"
#import "ZZNewestListItem.h"
#import "EXTScope.h"



///////

@interface NewestViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) NSInteger page; //当前所在的分页数

//这里跟model那里一样要遵循ZZNewestListItemModel
@property (nonatomic, strong) NSMutableArray<ZZNewestListItemModel *> *newestListItems;
@property (nonatomic, assign) BOOL isLastPage; // 是否是最后一页
@property (nonatomic, assign) BOOL isPageLoading; // 是否正在加载分页@end
@end

@implementation NewestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //之前没有在初始化数字所以数据没有显示出来
    self.newestListItems=[[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    @weakify(self);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        if (self.isPageLoading == NO) {
            self.page = 1;
            [self refreshDataWithPage:self.page];
        }
    }];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const tableViewReuseIdentifer = @"tableViewReuseIdentifer";
    ZZNewestCell *newestCell = [tableView dequeueReusableCellWithIdentifier:tableViewReuseIdentifer];
    if (newestCell == nil) {
        newestCell = [[ZZNewestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewReuseIdentifer];
        //        newestCell.selectedBackgroundView = [[UIView alloc] initWithFrame:newestCell.frame];
        //        newestCell.selectedBackgroundView.backgroundColor = UIColorFromRGB(0x)
    }
    
    
    [newestCell updateWithNewestModel:self.newestListItems[indexPath.row]];
    return newestCell;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newestListItems.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZZNewestCell *newestCell = (ZZNewestCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return newestCell.frame.size.height;
}



#pragma mark - custom
- (void)refreshDataWithPage:(NSInteger)page{
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @(page);
    @weakify(self);
    parameters[@"token"] = @"2b3aa3e88894040e148a7ad740185173";
    self.isPageLoading = YES;
    [[ZZHttpClient sharedHTTPClient] GET:@"/question/newest" parameters:parameters success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        @strongify(self);
        self.isPageLoading = NO;
        
        ZZNewestListModel *newestListModel = [[ZZNewestListModel alloc] initWithDictionary:responseObject error:nil];
        //这里已经成功取出最初的三个对象
        if (newestListModel.status == 0) {  // 成功
            
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
            
            // 如果是加载第一个数据
            if (self.page == 1) {
                [self.newestListItems removeAllObjects];
            }
            
            // 更新数据源
            NSArray *newestListItemModel = newestListModel.data.items;//这里好多层 不是很理解
            [self.newestListItems addObjectsFromArray:newestListItemModel];
            
            
            // 计算是不是最后一页
            BOOL isLastPage = (self.newestListItems.count >= newestListModel.data.page.total);
            self.isLastPage = isLastPage;
            
            
            [self.tableView reloadData];
        }else{
           // [self handleNewestListResponseFailure];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
        self.isPageLoading = NO;
        //[self handleNewestListResponseFailure];
        
    }];
    
}
/*
- (void)handleNewestListResponseFailure{
    [self showText:@"网络错误，请重试"];
    [self.tableView.footer endRefreshing];
    [self.tableView.header endRefreshing];
    if(self.page >=1){
        self.page -= 1;
    }
}*/

@end
