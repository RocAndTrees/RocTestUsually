//
//  3DTouchViewController.m
//  RocUsually
//
//  Created by pxl on 2016/12/20.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import "Demo3DTouchViewController.h"
#import "SearchViewController.h"
#import <Masonry.h>

@interface Demo3DTouchViewController ()<UIViewControllerPreviewingDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)  UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *myArray;

@end

@implementation Demo3DTouchViewController

#pragma mark - ---- lefe cycle 🍏
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 20; i++) {
        [_myArray addObject:[NSString stringWithFormat:@"test%li",i]];
    }

    
    [self buildTableView];
    
    [_myTableView  reloadData];
    
}

#pragma mark - ---- event response 🍐

#pragma mark - ---- private methods 🍊
-(void)buildTableView{
    _myTableView = [[UITableView alloc] init];
    [self.view addSubview:_myTableView];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
}
#pragma mark - ---- delegate 🍎
#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _myArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.textLabel.text = _myArray[indexPath.row];
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSLog(@"3D Touch  可用!");
        //给cell注册3DTouch的peek（预览）和pop功能
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    } else {
        NSLog(@"3D Touch 无效");
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"toSearch" sender:indexPath];
}


#pragma mark - UIViewControllerPreviewingDelegate

//peek(预览)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //获取按压的cell所在行，[previewingContext sourceView]就是按压的那个视图
    NSIndexPath *indexPath = [_myTableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
    
    //设定预览的界面
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    SearchViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"searchController"];
    SearchViewController *childVC = [[SearchViewController alloc] init];
    childVC.preferredContentSize = CGSizeMake(0.0f,500.0f);
    childVC.str = [NSString stringWithFormat:@"我是%@,用力按一下进来",_myArray[indexPath.row]];
    
    //调整不被虚化的范围，按压的那个cell不被虚化（轻轻按压时周边会被虚化，再少用力展示预览，再加力跳页至设定界面）
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width,40);
    previewingContext.sourceRect = rect;
    
    //返回预览界面
    return childVC;
}

//pop（按用点力进入）
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *index = (NSIndexPath *)sender;
    if ([segue.identifier isEqualToString:@"toSearch"]) {
        SearchViewController *childVC = segue.destinationViewController;
        childVC.str = [NSString stringWithFormat:@"我是%@,用力按一下进来",_myArray[index.row]];
    }
}


#pragma mark - ---- getters and setters 🍋


@end
