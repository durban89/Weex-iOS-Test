//
//  ViewController.m
//  Weex Test
//
//  Created by durban on 17/1/12.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame;
    
//    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8080/weex-bootstrap.js?v=3"];
    [_instance renderWithURL:url];

    
    
    
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        weakSelf.weexView = view;
        
        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        //处理失败回调的逻辑。
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //处理页面渲染完成的逻辑。
    };
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_instance destroyInstance];
}


@end
