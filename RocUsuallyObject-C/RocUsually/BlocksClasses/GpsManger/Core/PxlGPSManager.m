

//
//  PxlGPSManager.m
//  yunbo2016
//
//  Created by pxl on 2017/1/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PxlGPSManager.h"
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

@interface PxlGPSManager()<CLLocationManagerDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate>
//系统自带原生 定位
@property (nonatomic, strong) CLLocationManager *locCLLocationManger;

@property (nonatomic, strong) PxlGpsCLConfig * configCLConst;

@property (nonatomic, strong) PxlGpsBaiduConfig * configBDConst;

//百度 定位
@property (nonatomic ,strong)  BMKLocationService *locService;
//百度 地理编码
@property (nonatomic ,strong)  BMKGeoCodeSearch   *geocodesearch;
@property (nonatomic ,strong)  BMKReverseGeoCodeOption *reverseGeoCodeOption;


@end


@implementation PxlGPSManager

static PxlGPSManager  *_instance;

+ (instancetype)sharedGpsManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[PxlGPSManager alloc] init];
    });
    return _instance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _locCLLocationManger = [[CLLocationManager alloc] init];
        [_locCLLocationManger setDelegate:self];
        [_locCLLocationManger setDistanceFilter:kCLLocationAccuracyHundredMeters];
        [_locCLLocationManger setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        
        //定位
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate = self;

        
    }
    return self;
}



-(void)start{
    
    if ([CLLocationManager locationServicesEnabled] &&
        (([CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted) &&
         ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied))) {
            _locService.delegate = self;
            [_locService startUserLocationService];
        } else {
//            NSString *alertStr = IOS7 ? @"设置－隐私－定位服务" : @"设置－定位服务";
//            NSString *message = [NSString stringWithFormat:@"云泊没有获得系统的位置信息权限，无法获得你的位置\n\n(在iPhone的%@中开启)", alertStr];
//            UIAlertView *view = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"没有位置信息权限", nil)
//                                                           message:NSLocalizedString(message, @"")
//                                                          delegate:nil
//                                                 cancelButtonTitle:NSLocalizedString(@"确定", nil)
//                                                 otherButtonTitles:nil, nil];
//            [view show];
        }
    
    
}


#pragma mark // Delegate _CLLocation
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = locations[0];
    PP_SAFE_BLOCK(_configCLConst.successBlock, manager, location);
}

#pragma mark // Location Delegate
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    
    //直接返回
    PP_SAFE_BLOCK(_configBDConst.successBlock, _locService, userLocation);
    
    if (_configBDConst.geoCodeResultBlock) {
        //search  需要 appdelegate里的 BMKMapManager 初始化后才行
        _geocodesearch = [[BMKGeoCodeSearch alloc] init];
        _geocodesearch.delegate = self;
        //反编码
        _reverseGeoCodeOption = [[BMKReverseGeoCodeOption alloc] init];
        _reverseGeoCodeOption.reverseGeoPoint = userLocation.location.coordinate;
        [_geocodesearch reverseGeoCode:_reverseGeoCodeOption];
    }
    
}


#pragma mark // BMKGeoCodeSearch Delegate
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch*)searcher result:(BMKReverseGeoCodeResult*)result errorCode:(BMKSearchErrorCode)error
{
    
    PP_SAFE_BLOCK(_configBDConst.geoCodeResultBlock, searcher, result, error);
    
}


#pragma mark --- private
//No.1 系统自带 定位
-(NSUInteger)locationConfiguration:(PxlConfigBlock)configBlock onSuccess:(PP_CLSuccessBlock)successBlock{
    _configCLConst = [[PxlGpsCLConfig alloc] init];
    PP_SAFE_BLOCK(configBlock, _configCLConst);
    
    if (successBlock) {
        [_configCLConst setValue:successBlock forKey:@"_successBlock"];
    }
    
    [_locCLLocationManger startUpdatingLocation];

    return 0;
}

//No、2 百度定位
-(NSUInteger)locationBaiduConfiguration:(PxlBaiduConfigBlock)configBlock onSuccess:(PP_BDSuccessBlock)successBlock{
    _locService.delegate = self;
    
    _configBDConst = [[PxlGpsBaiduConfig alloc] init];
    PP_SAFE_BLOCK(configBlock, _configBDConst);

    if (successBlock) {
        [_configBDConst setValue:successBlock forKey:@"_successBlock"];
    }
    
    [_locService startUserLocationService];


    
    return 0;
}

//No、3 百度定位 + 地理反编译
-(NSUInteger)locationBaiduConfiguration:(PxlBaiduConfigBlock)configBlock onSuccess:(PP_BDSuccessBlock)successBlock onGeoCode:(PP_BDGeoCodeResultBlock)geoCodeBlock{
    _locService.delegate = self;
    
    _configBDConst = [[PxlGpsBaiduConfig alloc] init];
    PP_SAFE_BLOCK(configBlock, _configBDConst);
    
    if (successBlock) {
        [_configBDConst setValue:successBlock forKey:@"_successBlock"];
    }
    if (geoCodeBlock) {
        [_configBDConst setValue:geoCodeBlock forKey:@"_geoCodeResultBlock"];
    }
    
    
    
    [_locService startUserLocationService];

    return 0;
}




#pragma mark --- public
+(NSUInteger)locationConfiguration:(PxlConfigBlock)configBlock onSuccess:(PP_CLSuccessBlock)successBlock{
    
    return [[PxlGPSManager sharedGpsManager] locationConfiguration:configBlock onSuccess:successBlock];
}

+(NSUInteger)locationBaiduConfiguration:(PxlBaiduConfigBlock)configBlock onSuccess:(PP_BDSuccessBlock)successBlock{
    
    return [[PxlGPSManager sharedGpsManager] locationBaiduConfiguration:configBlock onSuccess:successBlock];
}

+(NSUInteger)locationBaiduConfiguration:(PxlBaiduConfigBlock)configBlock onSuccess:(PP_BDSuccessBlock)successBlock onGeoCode:(PP_BDGeoCodeResultBlock)geoCodeBlock{
    
    return [[PxlGPSManager sharedGpsManager] locationBaiduConfiguration:configBlock onSuccess:successBlock onGeoCode:geoCodeBlock];
}






@end
