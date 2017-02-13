//
//  RocUsuallyTests.m
//  RocUsuallyTests
//
//  Created by pxl on 2016/12/21.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <STAlertView/STAlertView.h>
#import <AFNetworking/AFNetworking.h>

//#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "ViewController.h"
//waitForExpectationsWithTimeout是等待时间，超过了就不再等待往下执行。
#define WAIT do {\
[self expectationForNotification:@"RSBaseTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"RSBaseTest" object:nil];


@interface RocUsuallyTests : XCTestCase

@property(nonatomic, strong)STAlertView *stAlertView;

@end

@implementation RocUsuallyTests

-(void)testRequest{
        // 1.获得请求管理者
//        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//        mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
//        
//        // 2.发送GET请求
//        [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"responseObject:%@",responseObject);
//            XCTAssertNotNil(responseObject, @"返回出错");
//            NOTIFY //继续执行
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"error:%@",error);
//            XCTAssertNil(error, @"请求出错");
//            NOTIFY //继续执行
//        }];
//        WAIT  //暂停
    
    self.stAlertView = [[STAlertView alloc]initWithTitle:@"验证码" message:nil textFieldHint:@"请输入手机验证码" textFieldValue:nil cancelButtonTitle:@"取消" otherButtonTitle:@"确定" cancelButtonBlock:^{
        //点击取消返回后执行
        //        [self testAlertViewCancel];
        NOTIFY //继续执行
    } otherButtonBlock:^(NSString *b) {
        //点击确定后执行
        //        [self alertViewComfirm:b];
        NOTIFY //继续执行
    }];
    [self.stAlertView show];
    
    
}

-(void)testDataView{
    self.stAlertView = [[STAlertView alloc]initWithTitle:@"验证码" message:nil textFieldHint:@"请输入手机验证码" textFieldValue:nil cancelButtonTitle:@"取消" otherButtonTitle:@"确定" cancelButtonBlock:^{
        //点击取消返回后执行
        //        [self testAlertViewCancel];
        NOTIFY //继续执行
    } otherButtonBlock:^(NSString *b) {
        //点击确定后执行
        //        [self alertViewComfirm:b];
        NOTIFY //继续执行
    }];
    [self.stAlertView show];

}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    

    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
    }];
}


/** 
 XCTAssertNotNil(a1, format…) 当a1不为nil时成立
 XCTAssert(expression, format...) 当expression结果为YES成立
 XCTAssertTrue(expression, format...) 当expression结果为YES成立；
 XCTAssertEqualObjects(a1, a2, format...) 判断相等，当[a1 isEqualTo: a2]返回YES的时候成立
 XCTAssertEqual(a1, a2, format...) 当a1==a2返回YES时成立
 XCTAssertNotEqual(a1, a2, format...) 当a1!=a2返回YES时成立
 */

@end
