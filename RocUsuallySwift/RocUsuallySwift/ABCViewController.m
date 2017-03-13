//
//  ABCViewController.m
//  RocUsuallySwift
//
//  Created by pxl on 2017/2/28.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "ABCViewController.h"
@interface ABCViewController ()

@end

@implementation ABCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton * button = [UIButton new];
    [self.view addSubview:button];
    button.frame = CGRectMake(150, 200, 150, 30);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonAction{
//    [self.navigationController pushViewController:ss animated:YES];
}
@end
