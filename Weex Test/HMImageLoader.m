//
//  HMImageLoader.m
//  Weex Test
//
//  Created by durban on 17/1/15.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

#import "HMImageLoader.h"

@implementation HMImageLoader

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock {
    self.dataTask = [self.sessionManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *imageData = responseObject;
        UIImage *image = [UIImage imageWithData:imageData];
        //      设置图片的大小
        if (image&&!CGRectEqualToRect(imageFrame, CGRectZero)) {
            //         开启图片上下文
            UIGraphicsBeginImageContext(imageFrame.size);
            //          绘制图片
            [image drawInRect:imageFrame];
            //          取出图片
            image = UIGraphicsGetImageFromCurrentImageContext();
            //          关闭图形上下文
            UIGraphicsEndImageContext();
        }
        //      成功回调
        completedBlock(image,nil,YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //      失败回调
        completedBlock(nil,error,YES);
    }];
    return self;
}
- (void)cancel {
    //  取消下载任务
    [self.dataTask cancel];
}
- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _sessionManager;
}

@end
