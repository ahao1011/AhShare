//
//  AhShareInfo.h
//  AhShare
//
//  Created by ah on 2017/3/9.
//  Copyright © 2017年 ah. All rights reserved.
//

#import <Foundation/Foundation.h>

//  分享信息数据模型

@interface AhShareInfo : NSObject

/**标题*/
@property (nonatomic,copy) NSString *title;
/**副标题*/
@property (nonatomic,copy) NSString *subTitle;
/**缩略图 缩略图（UIImage或者NSData类型，或者image_url）*/
@property (nonatomic,strong) id thumImg;
/**跳转链接*/
@property (nonatomic,copy) NSString *linkUrl;

@end
