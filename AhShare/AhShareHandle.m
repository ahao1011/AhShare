//
//  AhShareHandle.m
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//




#import "AhShareHandle.h"
#import <UMSocialCore/UMSocialCore.h>

@implementation AhShareHandle


// 转变成um的枚举, 后期如果分享模块换成其他的直接在这里进行变更
+ (UMSocialPlatformType)changeType:(AhSharePlatform)platformType{
    
    UMSocialPlatformType type = UMSocialPlatformType_UnKnown;
    
    switch (platformType) {
        case AhShare_QQ:
            type= UMSocialPlatformType_QQ;
            break;
        case AhShare_Qzone:
            type= UMSocialPlatformType_Qzone;
            break;
        case AhShare_WechatSession:
            type= UMSocialPlatformType_WechatSession;
            break;
        case AhShare_WechatTimeLine:
            type= UMSocialPlatformType_WechatTimeLine;
            break;
        case AhShare_Sina:
            type= UMSocialPlatformType_Sina;
            break;
            
        default:
            break;
    }
    return type;
}

+ (void)AhShareHandleWithinfo:(AhShareInfo *)info forplatformType:(AhSharePlatform)platformType{
    
    UMSocialMessageObject *obj = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject  *webpageObj = [UMShareWebpageObject shareObjectWithTitle:info.title descr:info.subTitle thumImage:info.thumImg];
    
    if (info.linkUrl.length>0) {
        webpageObj.webpageUrl = info.linkUrl;
    }
    obj.shareObject = webpageObj;
    UMSocialPlatformType type = [self changeType:platformType];
    if (type!=UMSocialPlatformType_UnKnown) {
        
        [[UMSocialManager defaultManager] shareToPlatform:type messageObject:obj currentViewController:self completion:^(id data, NSError *error) {
            
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
    }
}

+ (void)AhShareHandleGetUserInfoFormPlatform:(AhSharePlatform)platformType DoHandle:(void(^)(BOOL issus, NSString*username,NSString *usergender,NSString*usericonurl,NSString*uid,NSString*accessToken))dohandle{
    
    UMSocialPlatformType type = [self changeType:platformType];
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:type currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            
            if (dohandle!=nil) {
                
                dohandle(NO,@"",@"",@"",@"",@"");
            }
            
        } else {
            
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            AhLogInfo(@"授权信息 uid: %@", resp.uid);
            AhLogInfo(@"授权信息 accessToken: %@", resp.accessToken);
            AhLogInfo(@"授权信息 refreshToken: %@", resp.refreshToken);
            AhLogInfo(@"授权信息 expiration: %@", resp.expiration);
            // 用户信息
            AhLogInfo(@"用户信息 name: %@", resp.name);
            AhLogInfo(@"用户信息 iconurl: %@", resp.iconurl);
            AhLogInfo(@"用户信息 gender: %@", resp.gender);
            // 第三方平台SDK源数据
            AhLogInfo(@"第三方平台SDK源数据 originalResponse: %@", resp.originalResponse);
            
            if (dohandle!=nil) {
                
                dohandle(YES,resp.name,resp.gender,resp.iconurl,resp.uid,resp.accessToken);
            }
            
        }
    }];
    
}

+ (BOOL)AhHandleOpenURL:(NSURL *)url options:(NSDictionary *)options{
    
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响。
    return [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
}

+ (BOOL)AhHandleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    return [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

+ (BOOL)AhHandleOpenURL:(NSURL *)url{

    return [[UMSocialManager defaultManager] handleOpenURL:url];
}

@end
