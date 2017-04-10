//
//  PxlGPSConst.h
//  yunbo2016
//
//  Created by pxl on 2017/1/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#ifndef PxlGPSConst_h
#define PxlGPSConst_h
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

#define PP_SAFE_BLOCK(BlockName, ...) ({ !BlockName ? nil : BlockName(__VA_ARGS__); })
#define PPLock() dispatch_semaphore_wait(self->_lock, DISPATCH_TIME_FOREVER)
#define PPUnlock() dispatch_semaphore_signal(self->_lock)


NS_ASSUME_NONNULL_BEGIN


@class PxlGpsCLConfig, PxlGpsBaiduConfig, CLLocation, CLLocationManager, BMKLocationService, BMKUserLocation, BMKGeoCodeSearch, BMKReverseGeoCodeResult;

/**
 Types enum for GPSModel.
 */




///------------------------------
/// @name  Config Blocks
///------------------------------

typedef void (^PxlConfigBlock)(PxlGpsCLConfig *config);

typedef void (^PxlBaiduConfigBlock)(PxlGpsBaiduConfig *config);


///--------------------------------
/// @name  Callback Blocks
///--------------------------------


//CLLocation SuccessBack
typedef void (^PP_CLSuccessBlock)(CLLocationManager * locationManager, CLLocation * _Nullable location);

//baiduLoction SuccessBack
typedef void (^PP_BDSuccessBlock)(BMKLocationService * locationManager, BMKUserLocation * location);
//baiduLocation geoCodeResultBack
typedef void (^PP_BDGeoCodeResultBlock)(BMKGeoCodeSearch*searcher ,BMKReverseGeoCodeResult* result,BMKSearchErrorCode error);



NS_ASSUME_NONNULL_END


#endif /* PxlGPSConst_h */

