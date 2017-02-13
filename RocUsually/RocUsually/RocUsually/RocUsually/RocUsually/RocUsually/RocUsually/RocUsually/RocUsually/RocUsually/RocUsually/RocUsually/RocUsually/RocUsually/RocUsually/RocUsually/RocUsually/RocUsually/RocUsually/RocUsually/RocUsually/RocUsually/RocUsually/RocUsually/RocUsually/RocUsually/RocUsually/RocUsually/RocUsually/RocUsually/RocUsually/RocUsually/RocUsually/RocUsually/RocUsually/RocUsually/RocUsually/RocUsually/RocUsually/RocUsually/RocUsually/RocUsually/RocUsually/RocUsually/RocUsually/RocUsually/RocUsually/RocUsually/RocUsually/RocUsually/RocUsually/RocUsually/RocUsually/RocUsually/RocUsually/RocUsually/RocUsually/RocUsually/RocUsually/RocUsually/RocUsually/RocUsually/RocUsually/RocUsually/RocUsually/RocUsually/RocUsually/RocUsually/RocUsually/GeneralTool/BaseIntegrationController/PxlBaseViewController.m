//
//  PxlBaseViewController.m
//  P_Manage
//
//  Created by pxl on 2016/9/29.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import "PxlBaseViewController.h"

@interface PxlBaseViewController ()

@end

@implementation PxlBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)pxl_HomeTopViewDelegate:(NSString *)pushString{
    UIViewController *controller = [[NSClassFromString(pushString) alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
