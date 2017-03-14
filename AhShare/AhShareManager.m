//
//  AhShareManager.m
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//

#import "AhShareManager.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#import "AhShareHeader.h"

@implementation AhShareManager

+ (void)SetUmSocial{
    
    NSString *plistPath  = [[NSBundle mainBundle]pathForResource:@"AhShareSet" ofType:@"plist"];;
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    if (dic!=nil) {
       

        [[UMSocialManager defaultManager] setUmSocialAppkey:dic[@"UmSocialAppkey"]];
        
        // 关闭https强制校验
        /*
         * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
         <key>NSAppTransportSecurity</key>
         <dict>
         <key>NSAllowsArbitraryLoads</key>
         <true/>
         </dict>
         */
        
        [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
        /* 设置微信的appKey和appSecret */
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:dic[@"UMWXAppId"] appSecret:dic[@"UMWXSecret"] redirectURL:@"http://mobile.umeng.com/social"];
        
        /**设置分享到QQ互联的appID*/
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:dic[@"UMQQAppId"]/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
        
        
        
    }else{
        
        AhLogInfo(@"配置的AhShareSet.plist文件未找到");
    }
    
    
}

+ (void)usingWaterMark:(BOOL)use{
    
    [UMSocialGlobal shareInstance].isUsingWaterMark = use;
}

+ (void)openLog:(BOOL)open{
    
     [[UMSocialManager defaultManager] openLog:open];
}
+ (void)showWithType:(AhShareShowType)type info:(AhShareInfo *)info{
    
    
    if (type==Show_CUSTOM) {
        
        // 展示AhShareUI
        /**好吧 我承认我再这里偷懒了,在UM5.4之前我记得那个默认的分享面板依然巨丑来,之前的项目都是自定义面板去做分享功能. 这次封装的6.4 UM自带的分享界面我还是能接受的, 各位大咖如果觉得不满足就自己再建一个分享界面吧  然后调用 AhShareHandle中的+ AhShareHandleWithinfo: forplatformType:即可*/
    }else{
        
        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
            
            
            UMSocialMessageObject *obj = [UMSocialMessageObject messageObject];
            
            UMShareWebpageObject  *webpageObj = [UMShareWebpageObject shareObjectWithTitle:info.title descr:info.subTitle thumImage:info.thumImg];
            
            if (info.linkUrl.length>0) {
                webpageObj.webpageUrl = info.linkUrl;
            }
            obj.shareObject = webpageObj;
            
            [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:obj currentViewController:self completion:^(id data, NSError *error) {
                
                if (error) {
                    AhLogInfo(@"************Share fail with error %@*********",error);
                }else{
                    if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                        
                        UMSocialShareResponse *resp = data;
                        //分享结果消息
                        AhLogInfo(@"response message is %@",resp.message);
                        //第三方原始返回的数据
                        AhLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                        
                    }else{
                        AhLogInfo(@"response data is %@",data);
                    }
                }
            }];


        }];
        
    }
}

@end
