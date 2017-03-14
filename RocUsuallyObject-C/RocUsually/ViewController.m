//
//  ViewController.m
//  RocUsually
//
//  Created by pxl on 2016/12/7.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
//----自定义 view
#import "XTNetReloader.h"
#import "WeChatStylePlaceHolder.h"
#import "RocUsually-Swift.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

/**
 *  lazy load dataSource
 *
 *  @return NSMutableArray
 */
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"center";
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.dataSource = [NSMutableArray arrayWithObjects:
                       @"PlaceViewController",
                       @"LoginViewController",
                       @"Demo3DTouchViewController"
                       ,@"KINWebBrowserExampleViewController",
                       @"GPSTestViewController",
                       @"WeexViewController",
                       @"ScrollViewAutolayout",
                       @"CustomViewController",
                       @"LXSWebViewController",
                       nil];
    
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", @"Random Data", self.dataSource[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *controllerName = [self.dataSource objectAtIndex:indexPath.row];
    if ([controllerName isEqualToString:@"LXSWebViewController"]) {
        LXSWebViewController * controller = [[LXSWebViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        return;
    }
    
    
    UIViewController *controller = [[NSClassFromString(controllerName) alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
