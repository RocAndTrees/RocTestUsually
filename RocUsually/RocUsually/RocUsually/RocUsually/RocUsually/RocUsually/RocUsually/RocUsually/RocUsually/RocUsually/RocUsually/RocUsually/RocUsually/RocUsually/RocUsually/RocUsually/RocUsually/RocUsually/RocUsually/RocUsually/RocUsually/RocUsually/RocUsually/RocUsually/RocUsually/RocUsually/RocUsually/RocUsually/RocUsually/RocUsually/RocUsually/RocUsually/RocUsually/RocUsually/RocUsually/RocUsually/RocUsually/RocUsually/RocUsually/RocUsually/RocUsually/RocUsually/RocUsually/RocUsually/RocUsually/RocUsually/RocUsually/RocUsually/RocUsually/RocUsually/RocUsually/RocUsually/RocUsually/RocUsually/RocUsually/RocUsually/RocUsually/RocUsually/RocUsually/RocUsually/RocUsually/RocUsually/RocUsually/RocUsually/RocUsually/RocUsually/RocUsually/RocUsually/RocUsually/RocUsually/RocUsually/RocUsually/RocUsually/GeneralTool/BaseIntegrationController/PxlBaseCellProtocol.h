//
//  PxlBaseCellProtocol.h
//  P_Manage
//
//  Created by pxl on 2016/11/6.
//  Copyright © 2016年 pxl. All rights reserved.
//

#ifndef PxlBaseCellProtocol_h
#define PxlBaseCellProtocol_h




typedef enum : NSUInteger {
    PxlBaseCellModeOne,
} PxlBaseCellMode;

@protocol PxlBaseCellDelegate <NSObject>
@optional
/**
 projectviewBottomDelegate
 
 @param Mode     类别
 @param coreData 数据
 */
//-(void)projectViewBottomDelegateMode:(NSUInteger)Mode andData:(id)coreData;

-(void)PxlBaseCellItemSelectMode:(NSUInteger)Mode andData:(id)coreData;
@end

#endif /* PxlBaseCellProtocol_h */
