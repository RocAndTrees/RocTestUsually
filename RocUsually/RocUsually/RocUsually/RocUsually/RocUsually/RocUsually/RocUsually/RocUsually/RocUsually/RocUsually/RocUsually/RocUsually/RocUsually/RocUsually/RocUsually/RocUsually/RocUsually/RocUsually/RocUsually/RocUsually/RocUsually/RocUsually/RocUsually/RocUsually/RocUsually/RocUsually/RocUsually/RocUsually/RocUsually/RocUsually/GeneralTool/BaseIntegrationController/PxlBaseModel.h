//
//  PxlBaseModel.h
//  P_Manage
//
//  Created by pxl on 2016/11/4.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>
#define EmcountPath(name)  [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.data",name]]

@interface PxlBaseModel : NSObject<NSCoding>



@end
