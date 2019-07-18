//
//  UITextField+RYNumberKeyboard.h
//  RYNumberKeyboardDemo
//
//  Created by Resory on 16/2/21.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (RYNumberKeyboard)

/**
 是否显示输入的钱的键盘
 */
@property (nonatomic, assign) BOOL isShowMoneyKeyboard;

/**
 设置支付键盘
 */
- (void)setMoneyKeyboard;

@end
