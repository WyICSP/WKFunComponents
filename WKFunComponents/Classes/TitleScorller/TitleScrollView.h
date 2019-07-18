//
//  TitleScrollView.h
//  titleScrollViewTest
//
//  Created by 王宇 on 16/5/17.
//  Copyright © 2016年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleScrollHelper.h"
#import <objc/runtime.h>

@interface TitleScrollView : UIScrollView
typedef void (^SelectBlock)(NSInteger index);

/**
 *   创建一个标题滚动栏
 *
 *  @param frame           布局
 *  @param titleArray     标题数组
 *  @param selected_index 默认选中按钮的索引
 *  @param scrollEnable   能否滚动
 *  @param isEqualWidth   下面的条子是否按数量等分宽度 YES:等分 NO:按照标题宽度
 *  @param selectColor    选择颜色
 *  @param defaultColor   默认颜色
 *  @param selectBlock    点击标题回调方法
 */
- (instancetype)initWithFrame:(CGRect)frame
                   TitleArray:(NSArray *)titleArray
                selectedIndex:(NSInteger)selected_index
                titleFontSize:(CGFloat)titleFontSize
                 scrollEnable:(BOOL)scrollEnable
               lineEqualWidth:(BOOL)isEqualWidth
             isFontNeedChange:(BOOL)isFontNeedChange
                  selectColor:(UIColor *)selectColor
                 defaultColor:(UIColor *)defaultColor
                  SelectBlock:(SelectBlock)selectBlock;

/**
 *   创建一个标题滚动栏 滚动条用图片你的
 *
 *  @param frame           布局
 *  @param name           图片名称
 *  @param titleArray     标题数组
 *  @param selected_index 默认选中按钮的索引
 *  @param scrollEnable   能否滚动
 *  @param isEqualWidth   下面的条子是否按数量等分宽度 YES:等分 NO:按照标题宽度
 *  @param selectColor    选择颜色
 *  @param defaultColor   默认颜色
 *  @param selectBlock    点击标题回调方法
 */
- (instancetype)initWithFrame:(CGRect)frame
                     lineName:(NSString *)name
                   TitleArray:(NSArray *)titleArray
                selectedIndex:(NSInteger)selected_index
                titleFontSize:(CGFloat)titleFontSize
                 scrollEnable:(BOOL)scrollEnable
               lineEqualWidth:(BOOL)isEqualWidth
             isFontNeedChange:(BOOL)isFontNeedChange
                  selectColor:(UIColor *)selectColor
                 defaultColor:(UIColor *)defaultColor
                  SelectBlock:(SelectBlock)selectBlock;

/**
 *   创建一个标题滚动栏 每条数据的字数相同的时候使用这个方法初始化
 *
 *  @param frame           布局
 *  @param titleArray     标题数组
 *  @param selected_index 默认选中按钮的索引
 *  @param scrollEnable   能否滚动
 *  @param isEqualWidth   下面的条子是否按数量等分宽度 YES:等分 NO:按照标题宽度
 *  @param selectColor    选择颜色
 *  @param defaultColor   默认颜色
 *  @param selectBlock    点击标题回调方法
 */
- (instancetype)initWithEqualFrame:(CGRect)frame
                        TitleArray:(NSArray *)titleArray
                     selectedIndex:(NSInteger)selected_index
                     titleFontSize:(CGFloat)titleFontSize
                      scrollEnable:(BOOL)scrollEnable
                    lineEqualWidth:(BOOL)isEqualWidth
                       selectColor:(UIColor *)selectColor
                      defaultColor:(UIColor *)defaultColor
                       SelectBlock:(SelectBlock)selectBlock;

/**
 *   创建一个标题滚动栏 每条数据的字数相同的时候使用这个方法初始化 有选中的时候有背景颜色的情况下使用
 *
 *  @param frame           布局
 *  @param titleArray     标题数组
 *  @param selected_index 默认选中按钮的索引
 *  @param scrollEnable   能否滚动
 *  @param isEqualWidth   下面的条子是否按数量等分宽度 YES:等分 NO:按照标题宽度
 *  @param selectColor    选择颜色
 *  @param defaultColor   默认颜色
 *  @param selectBlock    点击标题回调方法
 */
- (instancetype)initWithBGColorEqualFrame:(CGRect)frame
                               TitleArray:(NSArray *)titleArray
                            selectedIndex:(NSInteger)selected_index
                            titleFontSize:(CGFloat)titleFontSize
                             scrollEnable:(BOOL)scrollEnable
                           lineEqualWidth:(BOOL)isEqualWidth
                              selectColor:(UIColor *)selectColor
                             defaultColor:(UIColor *)defaultColor
                              normalColor:(UIColor *)normalColor
                              SelectBlock:(SelectBlock)selectBlock;


/**
 *  数据源
 */
@property (nonatomic,strong) NSArray *titleArray;

/**
 *  是否需要滚动
 */
@property (nonatomic,assign)BOOL scrollEnable;

/**
 是否需要改变按钮背景颜色
 */
@property (nonatomic, assign) BOOL isChangeBtnBgColor;

/**
 *  选择回调
 */
@property (nonatomic,copy)  SelectBlock block;

/**
 *  是否需要均分
 */
@property (nonatomic, assign) BOOL isEqualWidth;

/**
 字体是否需要变大
 */
@property (nonatomic, assign) BOOL isFontNeedChange;
/**
 line图片名称
 */
@property (nonatomic, copy) NSString *imgName;
/**
 *  修改选中标题
 *  @param selectedIndex 选中标题的索引
 */
-(void)setSelectedIndex:(NSInteger)selectedIndex;
/**
 *  把按钮放出来以便改变可以其颜色 （
 */
@property (nonatomic,strong) UIButton *titleButton;
/**
 *  把line放出来,有的界面不需要显示,直接隐藏它
 */
@property (nonatomic, strong) UILabel *line;
/**
 下面的横线用图片
 */
@property (nonatomic, strong) UIImageView *lineImg;
/**
 * 把选中的按钮放出来以便改变可以其颜色
 */
@property (nonatomic,strong) UIButton *selectedButt;
/**
 *  把所有的按钮暴露出来
 */
@property (nonatomic,strong) NSMutableArray *buttonArray;
/**
 *  默认颜色
 */
@property (nonatomic,strong) UIColor *defaultColor;
/*
 *title为几行
 */
@property (nonatomic,assign) NSInteger numberOfLines;


/**
 *  选中的颜色
 */
@property (nonatomic,strong) UIColor *selectColor;

/**
 * 默认第几个被选中
 */
@property (nonatomic,assign) NSInteger selected_index;


@end

@interface UIView (Frames)
@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;
@end
