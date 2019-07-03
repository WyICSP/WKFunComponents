//
//  YukiWebViewController.h
//  YukiFramework
//
//  Created by 王宇 on 2018/1/19.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "YukiWebProgressLayer.h"

@interface YukiWebViewController : UIViewController 
/**
 进度条
 */
@property (nonatomic, strong)YukiWebProgressLayer *webProgressLayer;
/**
 webView
 */
@property (nonatomic, strong) WKWebView *webView;
/**
 网址链接
 */
@property (nonatomic, copy)   NSString  *urlString;
/**
 进度条颜色 默认为橙色
 */
@property (nonatomic, strong) UIColor   *progressColor;

@end
