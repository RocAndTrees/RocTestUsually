//
//  PxlBaseTableViewCell.h
//  P_Manage
//
//  Created by pxl on 2016/9/24.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PxlBaseCellProtocol.h"
@interface PxlBaseTableViewCell : UITableViewCell

@property (nonatomic ,assign) id <PxlBaseCellDelegate> delegate;

-(void)setData:(id)data;

@end
