//
//  HMImageLoader.h
//  Weex Test
//
//  Created by durban on 17/1/15.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WXImgLoaderProtocol.h>
#import <AFHTTPSessionManager.h>

@interface HMImageLoader : NSObject<WXImgLoaderProtocol, WXImageOperationProtocol>

///AFHTTPSessionManager
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
///下载任务
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end
