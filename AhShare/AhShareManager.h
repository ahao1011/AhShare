//
//  AhShareManager.h
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AhShareInfo.h"
typedef enum {  //  分享平台
    /**UM原有的*/
    Show_UM ,
    /**自定义的*/
    Show_CUSTOM
    
}AhShareShowType;

@interface AhShareManager : NSObject

/**展示*/
+ (void)showWithType:(AhShareShowType)type info:(AhShareInfo*)info;

/**是否打印日志*/
+ (void)openLog:(BOOL)open;
/**是否使用图片水印*/
+ (void)usingWaterMark:(BOOL)use;
/**um信息设置*/
+ (void)SetUmSocial;



@end
