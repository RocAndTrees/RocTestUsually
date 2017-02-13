//
//  PxlGpsBaiduConfig.h
//  RocUsually
//
//  Created by pxl on 2017/1/6.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PxlGPSConst.h"
NS_ASSUME_NONNULL_BEGIN

@interface PxlGpsBaiduConfig : NSObject

@property (nonatomic, copy, readonly, nullable) PP_BDSuccessBlock successBlock;

@property (nonatomic, copy, readonly, nullable) PP_BDGeoCodeResultBlock geoCodeResultBlock;


@end
NS_ASSUME_NONNULL_END
