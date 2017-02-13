//
//  PxlBaseListTableController.h
//  P_Manage
//
//  Created by pxl on 2016/12/6.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PxlBaseListTableController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray *dataArray;

@property(nonatomic, strong) UITableView *listTableView;


-(void)pxl_HomeTopViewDelegate:(NSString *)pushString;

@end
