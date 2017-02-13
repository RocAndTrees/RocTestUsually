//
//  PxlGPSManager.h
//  yunbo2016
//
//  Created by pxl on 2017/1/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "PxlGPSConst.h"

#import "PxlGpsCLConfig.h"
#import "PxlGpsBaiduConfig.h"

#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface PxlGPSManager : NSObject


#pragma -----public

/**
 locaiton 1.0
 CLLocation
 @param configBlock 配置数据
 @param successBlock 成功block
 @return 0  
 */
+(NSUInteger)locationConfiguration:(PxlConfigBlock)configBlock onSuccess:(PP_CLSuccessBlock)successBlock;


+(NSUInteger)locationBaiduConfiguration:(PxlBaiduConfigBlock)configBlock onSuccess:(PP_BDSuccessBlock)successBlock;

+(NSUInteger)locationBaiduConfiguration:(PxlBaiduConfigBlock)configBlock onSuccess:(PP_BDSuccessBlock)successBlock onGeoCode:(PP_BDGeoCodeResultBlock)geoCodeBlock;

@end
