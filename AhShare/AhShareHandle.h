//
//  AhShareHandle.h
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AhShareHeader.h"
#import "AhShareInfo.h"

@interface AhShareHandle : NSObject


/**
 分享功能

 @param info 分享模型
 @param platformType 分享平台
 */
+ (void)AhShareHandleWithinfo:(AhShareInfo*)info forplatformType:(AhSharePlatform)platformType;

/**
 第三方登录

 @param platformType 登录平台
 @param dohandle 登录后回调
 */
+ (void)AhShareHandleGetUserInfoFormPlatform:(AhSharePlatform)platformType DoHandle:(void(^)(BOOL issus, NSString*username,NSString *usergender,NSString*usericonurl,NSString*uid,NSString*accessToken))dohandle;

/**
 *  获得从sso或者web端回调到本app的回调
 *  @return 是否处理  YES代表处理成功，NO代表不处理
 *  在appDelegate中代理方法 - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options中执行
 */
+(BOOL)AhHandleOpenURL:(NSURL *)url options:(NSDictionary*)options;
/**在appDelegatez的- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation方法中执行*/
+(BOOL)AhHandleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
/**在appDelegatez的- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url方法中执行*/
+(BOOL)AhHandleOpenURL:(NSURL *)url;

@end
