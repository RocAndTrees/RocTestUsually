//
//  AFAppNetClient.h
//  yunbo2016
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppNetClient : AFHTTPSessionManager

+(instancetype) sharedClient;

@end
