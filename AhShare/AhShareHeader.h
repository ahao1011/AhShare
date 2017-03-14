//
//  AhShareHeader.h
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//

#ifndef AhShareHeader_h
#define AhShareHeader_h


#define AhLogInfo(format, ...)    UMSocialLog(UMSocialLogInfoFlagString,__FILE__,__PRETTY_FUNCTION__,__LINE__,format,##__VA_ARGS__)

typedef enum {  //  分享平台
    /**QQ聊天界面*/
    AhShare_QQ                    =0,
    /**QQ空间*/
    AhShare_Qzone                 =1 << 0,
    /**微信聊天*/
    AhShare_WechatSession         =1 << 1,
    /**微信朋友圈*/
    AhShare_WechatTimeLine        =1 << 2,
    /**新浪*/
    AhShare_Sina                  =1 << 3,

}AhSharePlatform;

#endif /* AhShareHeader_h */
