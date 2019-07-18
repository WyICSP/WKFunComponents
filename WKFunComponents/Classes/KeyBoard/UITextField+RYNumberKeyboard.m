//
//  UITextField+RYNumberKeyboard.m
//  RYNumberKeyboardDemo
//
//  Created by Resory on 16/2/21.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "UITextField+RYNumberKeyboard.h"
#import "RYNumberKeyboard.h"
#import <objc/runtime.h>

@implementation UITextField (RYNumberKeyboard)

- (void)setIsShowMoneyKeyboard:(BOOL)isShowMoneyKeyboard {
    objc_setAssociatedObject(self, @selector(isShowMoneyKeyboard), @(isShowMoneyKeyboard), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isShowMoneyKeyboard {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMoneyKeyboard {
    //设置键盘
    RYNumberKeyboard *tNumberKb = [[RYNumberKeyboard alloc] init];
    tNumberKb.textFiled = self;
    self.inputView = tNumberKb;
}

@end
