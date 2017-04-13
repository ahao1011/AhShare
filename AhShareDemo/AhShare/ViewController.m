//
//  ViewController.m
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//

#import "ViewController.h"
#import "AhShare.h"
#import "AhShareHandle.h"
#import <UMSocialCore/UMSocialCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    AhShareInfo *info = [[AhShareInfo alloc]init];
    info.title = @"hah";
    info.subTitle = @"描述...";
    info.thumImg = [UIImage imageNamed:@"kk"];
    info.linkUrl = @"http://www.baidu.com";
    
    [AhShareManager showWithType:Show_UM info:info];
    
}

- (IBAction)qq:(id)sender {
    
    
    [AhShareHandle AhShareHandleGetUserInfoFormPlatform:AhShare_QQ DoHandle:^(BOOL issus, NSString *username, NSString *usergender, NSString *usericonurl, NSString *uid, NSString *accessToken) {
        
    }];
    
}
- (IBAction)wx:(id)sender {
    
    [AhShareHandle AhShareHandleGetUserInfoFormPlatform:AhShare_WechatSession DoHandle:^(BOOL issus, NSString *username, NSString *usergender, NSString *usericonurl, NSString *uid, NSString *accessToken) {
        
    }];

}



@end
