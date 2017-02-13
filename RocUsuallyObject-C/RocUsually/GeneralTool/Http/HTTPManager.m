//
//  HTTPManager.m
//  yunbo2016
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "HTTPManager.h"
#import "AFAppNetClient.h"
#import "YAlertView.h"


#define HTTPKEY       @"dbc7f0747d204257b3ea0f9338a7958d"
#define SHOWSERVICE   @"User.applyForInvoice"

@implementation HTTPManager

+ (NSURLSessionDataTask *)getDataWithApiPre:(NSString *)apiPre GetParameters:(NSDictionary *)getParameters andPostParameters:(NSDictionary *)postParameters andBlocks:(void (^)(NSDictionary *result))block{
    
    
    if (!postParameters) {
        return     [[AFAppNetClient sharedClient] GET:apiPre parameters:getParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            NSNumber *ret = [responseObject objectForKey:@"ret"];
            NSDictionary *resultdic = (NSDictionary *)responseObject;
            if ([ret isEqualToNumber:@200]) {
                if (block) {
                    block(resultdic[@"data"][0]);
                }
            }else if ([ret isEqualToNumber:@401])
            {
//                if (NOEmptyStr(KgetUserValueByParaName(USERID))) {
//                    [self logout];
//                }
            }else
            {
//                [YAlertView showAlertViewWithString:responseObject[@"msg"]];
                block(nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error.code == -1001) {
//                [YAlertView showAlertViewWithString:@"请求超时,请检查网络"];
            }
        }];
    }else {
        if ([[getParameters objectForKey:@"pics"] count]) {//图片
            return[[AFAppNetClient sharedClient] POST:apiPre parameters:postParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

                NSArray *imageArr = getParameters[@"pics"];
                for(int i= 0 ; i< imageArr.count; i++){
                    NSData *imageData = imageArr[i];
                    
                    [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"user_data[avatar]"] fileName:[NSString stringWithFormat:@"%d.jpg",i+1] mimeType:@"image/jpeg"];
                }
            }progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSNumber *success = [responseObject objectForKey:@"success"];
                NSDictionary *resultdic = (NSDictionary *)responseObject;
                if ([success isEqualToNumber:@1]) {
                    block(resultdic);
                }else
                {
//                    [YAlertView showAlertViewWithString:responseObject[@"msg"]];
                    block(nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (error.code == -1001) {
                    [YAlertView showAlertViewWithString:@"请求超时,请检查网络"];
                }
                block(nil);
            }];
        }else{//post 数据

            return [[AFAppNetClient sharedClient] POST:apiPre parameters:postParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

                NSDictionary *resultdic = (NSDictionary *)responseObject;
                NSNumber *ret = [responseObject objectForKey:@"status"];
                if ([ret isEqualToNumber: @1]) {
//                    if (block&& resultdic[@"data"]) {
//                        block(resultdic[@"data"][0]);
//                    }else{
                        block(resultdic);
//                    }
                }
                else
                {
                    block(nil);
                    
                    [YAlertView showAlertViewWithString:responseObject[@"message"]];
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error.code == -1001) {
                    [YAlertView showAlertViewWithString:@"请求超时,请检查网络"];
                }
                block(nil);
            }];
        }
    }
    
}


///: 数据请求
+ (NSURLSessionDataTask *)getDataWithUrl:(NSString *)urlPath andPostParameters:(NSDictionary *)postPatameters andBlocks:(void (^)(NSDictionary *result))block
{
    
    return [self getDataWithApiPre:@"" GetParameters:nil andPostParameters:[self configCommonPamerDic:postPatameters] andBlocks:block];
}


///: 图片请求
+(NSURLSessionDataTask *) publishCarCirclWithUrl:(NSString *)urlPath andPostParameters:(NSDictionary *)postParamers andImageDic:(NSDictionary *)imagePatamer andBlocks:(void(^)(NSDictionary *result)) block
{
    return [self getDataWithApiPre:[self configUrl:urlPath] GetParameters:imagePatamer andPostParameters:[self configCommonPamerDic:postParamers] andBlocks:block];
    
}

+(NSString *)configUrl:(NSString *)url{
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@",MainAPI,url];
//
//    return urlStr;
    return url;
}

+(NSDictionary *)configCommonPamerDic:(NSDictionary *)parameter
{
    
    NSMutableDictionary *parametersDic = [[NSMutableDictionary alloc]init];
//    NSString *api_token = [self getApi_token];
    [parametersDic setObject:[self CurrentTime1970] forKey:@"time_stamp"];
    [parametersDic addEntriesFromDictionary:parameter];

    return parametersDic;
 }


+(NSString*)CurrentTime1970{
    
    NSDate *date = [NSDate date];
//    NSTimeInterval time  = date.timeIntervalSince1970;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    
//    NSString *timeStr = [NSString stringWithFormat:@"%.f",time];
    return destDateString;
    
}

+(NSString *)getApi_token
{
//    if ([UIScreen mainScreen].scale > 1)
//    {
//        if (KScreenWidth == 480)
//        {
//            return @"IWantToGetAIphone6";
//        }
//        else if(KScreenWidth == 568)
//        {
//            return @"IphoneRetinaEquipment";
//        }
//    }
//    
    return @"IphoneOtherEquipment";
}


@end
