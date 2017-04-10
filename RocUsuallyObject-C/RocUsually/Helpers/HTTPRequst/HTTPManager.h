//
//  HTTPManager.h
//  yunbo2016
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HubStyle) {
    HubStyleNormal,         //do not display
    HubStylePlan
};

@interface HTTPManager : NSObject



// 根据 Url 和 post 参数来获取数据
+ (NSURLSessionDataTask *)getDataWithUrl:(NSString *)urlPath andPostParameters:(NSDictionary *)postPatameters andBlocks:(void (^)(NSDictionary *result))block;
/**
 *
 *
 *  @param urlPath      MainAPi
 *  @param postPatamers 发送的参数
 *  @param imagePatamer 发送的图片资源
 *  @param block        成功回调
 *
 *  @return  */
+(NSURLSessionDataTask *) publishCarCirclWithUrl:(NSString *)urlPath andPostParameters:(NSDictionary *)postParamers andImageDic:(NSDictionary *)imagePatamer andBlocks:(void(^)(NSDictionary *result)) block;





@end
