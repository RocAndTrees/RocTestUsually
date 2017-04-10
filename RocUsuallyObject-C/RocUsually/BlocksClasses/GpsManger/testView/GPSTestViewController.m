//
//  GPSTestViewController.m
//  RocUsually
//
//  Created by pxl on 2017/1/5.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "GPSTestViewController.h"
//#import "PxlGPSHeader.h"
//#import <LXGpsManager/UIColor+Fetch.h>
@interface GPSTestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showDataLabel;
- (IBAction)starLocationAction:(id)sender;
@end

@implementation GPSTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)starLocationAction:(id)sender {
    
    /**
     No.1

     @param config
     @return
     */
//    [PxlGPSManager locationConfiguration:^(PxlGpsCLConfig * _Nonnull config) {
//        
//    } onSuccess:^(CLLocationManager * _Nonnull locationManager, CLLocation * _Nullable location) {
//        NSLog(@"%@, %@", locationManager, location);
//        [locationManager stopUpdatingLocation];
//    }];
    
    /**
     No.2
     
     @param config
     @return
     */
//    [PxlGPSManager locationBaiduConfiguration:^(PxlGpsBaiduConfig * _Nonnull config) {
//        
//    } onSuccess:^(BMKLocationService * _Nonnull locationManager, BMKUserLocation * _Nonnull location) {
//        [locationManager stopUserLocationService];
//                NSLog(@"%@, %@", locationManager, location);
//
//    }];

//    [PxlGPSManager locationBaiduConfiguration:^(PxlGpsBaiduConfig * _Nonnull config) {
//
//    } onSuccess:^(BMKLocationService * _Nonnull locationManager, BMKUserLocation * _Nonnull location) {
//        NSLog(@"%@, %@", locationManager, location);
//    } onGeoCode:^(BMKGeoCodeSearch * _Nonnull searcher, BMKReverseGeoCodeResult * _Nonnull result, BMKSearchErrorCode error) {
//        NSLog(@" \n %@,   %@", searcher, result);
//    }];
 

    
    
    
}
@end
