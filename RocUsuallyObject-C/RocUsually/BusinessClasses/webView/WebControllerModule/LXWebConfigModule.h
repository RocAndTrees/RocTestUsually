//
//  LXWebConfigModule.h
//  RocUsually
//
//  Created by pxl on 2017/3/8.
//  Copyright © 2017年 pxl. All rights reserved.
//  移动一些 共有数据判断等方法 减少WebController 代码量
//

#import <Foundation/Foundation.h>

@interface LXWebConfigModule : NSObject

//---共有

/**
 判断是否符合外部 请求的规范 <http，https>

 @param URL url
 @return bool ture = 包含 false = 不包含
 */
+ (BOOL)externalAppRequiredToOpenURL:(NSURL *)URL;



//---业务类



@end
