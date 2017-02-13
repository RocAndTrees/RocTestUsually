//
//  PxlBaseListTableController.m
//  P_Manage
//
//  Created by pxl on 2016/12/6.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import "PxlBaseListTableController.h"
#import <Masonry.h>
@interface PxlBaseListTableController ()

@end

@implementation PxlBaseListTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTableView];
    
    
}


-(void)pxl_HomeTopViewDelegate:(NSString *)pushString{
    UIViewController *controller = [[NSClassFromString(pushString) alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}



-(void)buildTableView{
    _listTableView = [[UITableView alloc] init];
    _listTableView.dataSource = self;
    _listTableView.tag = 5;
    _listTableView.delegate = self;
    [_listTableView setTableFooterView:[[UIView alloc] init]];
    [self.view addSubview:_listTableView];
    
    [_listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    if ([_listTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_listTableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_listTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_listTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}


@end
