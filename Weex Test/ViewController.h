//
//  ViewController.h
//  Weex Test
//
//  Created by durban on 17/1/12.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeexSDK/WXSDKInstance.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) WXSDKInstance *instance;
//URL属性(用于指定加载js的URL,一般声明在接口中,我们为了测试方法写在了类扩展中.)
@property (nonatomic, strong) NSURL *url;
//Weex视图
@property (weak, nonatomic) UIView *weexView;

@end

