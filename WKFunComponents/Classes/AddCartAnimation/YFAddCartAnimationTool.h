//
//  YFAddCartAnimationTool.h
//  YFFunComponents_Example
//
//  Created by 王宇 on 2019/1/3.
//  Copyright © 2019 wyxlh. All rights reserved.
//
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^animationFinisnBlock)(BOOL finish);

@interface YFAddCartAnimationTool : NSObject

@property (strong , nonatomic) CALayer *layer;
@property (copy , nonatomic) animationFinisnBlock animationFinisnBlock;
/**
 *  初始化
 *
 */
+ (instancetype)shareTool;
/**
 *  开始动画
 *
 *  @param view        添加动画的view
 *  @param rect        view 的绝对frame
 *  @param finishPoint 下落的位置
 *  @param completion 动画完成回调
 */
- (void)startAnimationandView:(UIView *)view
                         rect:(CGRect)rect
                  finisnPoint:(CGPoint)finishPoint
                  finishBlock:(animationFinisnBlock)completion;
/**
 *  摇晃动画
 *
 */
+ (void)shakeAnimation:(UIView *)shakeView;

@end

NS_ASSUME_NONNULL_END
