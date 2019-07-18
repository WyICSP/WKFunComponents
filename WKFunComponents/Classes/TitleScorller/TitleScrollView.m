//
//  TitleScrollView.m
//  titleScrollViewTest
//
//  Created by 王宇 on 16/5/17.
//  Copyright © 2016年 wy. All rights reserved.
//

#import "TitleScrollView.h"


@implementation TitleScrollView
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
                  SelectBlock:(SelectBlock)selectBlock {
    
    self =[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        self.showsHorizontalScrollIndicator = NO;
        CGFloat orign_x = 0;
        CGFloat height = self.frame.size.height;
        
        CGFloat space = scrollEnable ? 40 : [TitleScrollHelper caculateSpaceByTitleArray:titleArray rect:frame];
        self.buttonArray = [NSMutableArray new];
        self.block = selectBlock;
        self.isEqualWidth = isEqualWidth;
        self.isFontNeedChange = isFontNeedChange;
        for (int i = 0; i<titleArray.count; i++)
        {
            NSString *title =titleArray[i];
            CGSize size = [TitleScrollHelper titleSize:title height:frame.size.height];
            self.titleButton =[UIButton buttonWithType:UIButtonTypeCustom];
            self.titleButton.frame = CGRectMake(orign_x, 0, size.width+space, height);
            [self.titleButton setTitle:title forState:UIControlStateNormal];
            [self.titleButton setTitleColor:defaultColor forState:UIControlStateNormal];
            [self.titleButton setTitleColor:selectColor forState:UIControlStateSelected];
            [self.titleButton addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            self.titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleButton.titleLabel.font = isFontNeedChange ? [UIFont systemFontOfSize:12] : [UIFont boldSystemFontOfSize:16];
            self.titleButton.tag = i;
            self.titleButton.titleLabel.numberOfLines=self.numberOfLines;
            orign_x = orign_x+space+size.width;
            self.contentSize = CGSizeMake(orign_x, height);
            if (i == selected_index)
            {
                [self.titleButton setSelected:YES];
                self.selectedButt = self.titleButton;
                self.selectedButt.titleLabel.font =[UIFont boldSystemFontOfSize:titleFontSize];
                self.line =[[UILabel alloc]init];
                self.line.backgroundColor = selectColor;
                [self addSubview:self.line];
            }
            [ self.buttonArray addObject:self.titleButton];
            [self addSubview:self.titleButton];
        }
        [self buttonOffset:self.selectedButt];
    }
    return self;
    
}

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
                  SelectBlock:(SelectBlock)selectBlock {
    
    self =[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        self.showsHorizontalScrollIndicator = NO;
        CGFloat orign_x = 0;
        CGFloat height = self.frame.size.height;
        
        CGFloat space = scrollEnable ? 40 : [TitleScrollHelper caculateSpaceByTitleArray:titleArray rect:frame];
        self.buttonArray = [NSMutableArray new];
        self.block = selectBlock;
        self.imgName = name;
        self.isEqualWidth = isEqualWidth;
        self.isFontNeedChange = isFontNeedChange;
        for (int i = 0; i<titleArray.count; i++)
        {
            NSString *title =titleArray[i];
            CGSize size = [TitleScrollHelper titleSize:title height:frame.size.height];
            self.titleButton =[UIButton buttonWithType:UIButtonTypeCustom];
            self.titleButton.frame = CGRectMake(orign_x, 0, size.width+space, height);
            [self.titleButton setTitle:title forState:UIControlStateNormal];
            [self.titleButton setTitleColor:defaultColor forState:UIControlStateNormal];
            [self.titleButton setTitleColor:selectColor forState:UIControlStateSelected];
            [self.titleButton addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            self.titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleButton.titleLabel.font = isFontNeedChange ? [UIFont systemFontOfSize:12] : [UIFont boldSystemFontOfSize:titleFontSize];
            self.titleButton.tag = i;
            self.titleButton.titleLabel.numberOfLines=self.numberOfLines;
            orign_x = orign_x+space+size.width;
            self.contentSize = CGSizeMake(orign_x, height);
            if (i == selected_index)
            {
                [self.titleButton setSelected:YES];
                self.selectedButt = self.titleButton;
                self.selectedButt.titleLabel.font =[UIFont boldSystemFontOfSize:titleFontSize];
                self.lineImg =[[UIImageView alloc] init];
                self.lineImg.image = [UIImage imageNamed:name];
                [self addSubview:self.lineImg];
            }
            [ self.buttonArray addObject:self.titleButton];
            [self addSubview:self.titleButton];
        }
        [self buttonOffset:self.selectedButt];
    }
    return self;
}

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
                       SelectBlock:(SelectBlock)selectBlock {
    
    self =[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        self.showsHorizontalScrollIndicator = NO;
        CGFloat orign_x = 0;
        CGFloat height = self.frame.size.height;
        
        self.buttonArray = [NSMutableArray new];
        self.block = selectBlock;
        self.isEqualWidth = isEqualWidth;
        for (int i = 0; i<titleArray.count; i++)
        {
            NSString *title =titleArray[i];
            self.titleButton =[UIButton buttonWithType:UIButtonTypeCustom];
            self.titleButton.frame = CGRectMake(orign_x, 0, self.width/titleArray.count, height);
            [self.titleButton setTitle:title forState:UIControlStateNormal];
            [self.titleButton setTitleColor:defaultColor forState:UIControlStateNormal];
            [self.titleButton setTitleColor:selectColor forState:UIControlStateSelected];
            [self.titleButton addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            self.titleButton.titleLabel.textAlignment=NSTextAlignmentCenter;
            self.titleButton.titleLabel.font =[UIFont systemFontOfSize:titleFontSize];
            self.titleButton.tag = i;
            self.titleButton.titleLabel.numberOfLines=self.numberOfLines;
            orign_x = orign_x + self.width/titleArray.count;
            self.contentSize = CGSizeMake(orign_x, height);
            if (i == selected_index)
            {
                [self.titleButton setSelected:YES];
                self.selectedButt = self.titleButton;
                self.line =[[UILabel alloc]init];
                self.line.backgroundColor = selectColor;
                [self addSubview:self.line];
            }
            [ self.buttonArray addObject:self.titleButton];
            [self addSubview:self.titleButton];
        }
        [self buttonOffset:self.selectedButt];
    }
    return self;
    
}

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
                              SelectBlock:(SelectBlock)selectBlock {
    
    self =[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        self.showsHorizontalScrollIndicator = NO;
        self.isChangeBtnBgColor = YES;
        CGFloat orign_x = 0;
        CGFloat height = self.frame.size.height;
        
        self.buttonArray = [NSMutableArray new];
        self.block = selectBlock;
        self.isEqualWidth = isEqualWidth;
        for (int i = 0; i<titleArray.count; i++)
        {
            NSString *title =titleArray[i];
            self.titleButton =[UIButton buttonWithType:UIButtonTypeCustom];
            self.titleButton.frame = CGRectMake(orign_x, 0, self.width/titleArray.count, height);
            [self.titleButton setTitle:title forState:UIControlStateNormal];
            [self.titleButton setTitleColor:defaultColor forState:UIControlStateNormal];
            [self.titleButton setTitleColor:selectColor forState:UIControlStateSelected];
            [self.titleButton addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            self.titleButton.titleLabel.textAlignment=NSTextAlignmentCenter;
            self.titleButton.titleLabel.font =[UIFont systemFontOfSize:titleFontSize];
            self.titleButton.tag = i;
            self.titleButton.titleLabel.numberOfLines=self.numberOfLines;
            orign_x = orign_x + self.width/titleArray.count;
            self.contentSize = CGSizeMake(orign_x, height);
            if (i == selected_index)
            {
                [self.titleButton setSelected:YES];
                self.selectedButt = self.titleButton;
                self.line =[[UILabel alloc]init];
                self.line.backgroundColor = selectColor;
                self.titleButton.backgroundColor = [UIColor whiteColor];
                [self addSubview:self.line];
            }else{
                self.titleButton.backgroundColor = normalColor;
            }
            [ self.buttonArray addObject:self.titleButton];
            [self addSubview:self.titleButton];
        }
        [self buttonOffset:self.selectedButt];
    }
    return self;
}

//按钮点击
- (void)headButtonClick:(UIButton *)butt {
    
    [self setSelectedIndex:butt.tag];
    if (self.block) {
        self.block(butt.tag);
    }
    
}

//点击控制滚动视图的偏移量
- (void)buttonOffset:(UIButton *)butt animated:(BOOL)animated {
    if (animated)
    {
        [UIView animateWithDuration:0.2 animations:^{
            [self buttonOffset:butt];
        }];
    }else{
        [self buttonOffset:butt];
    }
}

- (void)buttonOffset:(UIButton *)butt {
    CGSize size = [TitleScrollHelper titleSize:butt.titleLabel.text height:butt.frame.size.height];
    CGFloat width = self.isEqualWidth?self.width/ self.buttonArray.count:size.width;
    if (self.imgName.length != 0) {
        self.lineImg.bounds = CGRectMake(0, 0, 27, 4);
        self.lineImg.center = CGPointMake(butt.center.x, butt.frame.size.height-4);
    }else {
        self.line.bounds = CGRectMake(0, 0, width, 2);
        self.line.center = CGPointMake(butt.center.x, butt.frame.size.height-2);
    }
    
    for (UIButton *button in  self.buttonArray)
    {
        BOOL isSelected = button.tag == butt.tag ? YES : NO;
        if (self.isFontNeedChange) {
            //如果字体需要变大
            if (isSelected) {
                button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            }else {
                button.titleLabel.font = [UIFont systemFontOfSize:12];
            }
        }
        [button setSelected:isSelected];
    }
    
    if (butt.center.x<=self.center.x)
    {
        self.contentOffset = CGPointMake(0, 0);
    }
    else if ((butt.center.x>self.center.x)&&((self.contentSize.width-butt.center.x)>(self.frame.size.width/2.0)))
    {
        self.contentOffset = CGPointMake(butt.center.x-self.center.x, 0);
    }else
    {
        self.contentOffset = CGPointMake(self.contentSize.width-self.frame.size.width, 0);
    }
    
}
/**
 *  修改选中标题
 *
 *  @param selectedIndex 选中标题的索引
 */
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selected_index = selectedIndex;
    for (UIButton *butt in  self.buttonArray)
    {
        if (butt.tag == selectedIndex)
        {
            [self buttonOffset:butt animated:YES];
            break;
        }
    }
}

@end

@implementation UIView (Frames)

/**
 *  基本参数
 */
- (CGFloat)x        {    return self.frame.origin.x;            }
- (CGFloat)y        {    return self.frame.origin.y;            }
- (CGFloat)width    {   return CGRectGetWidth(self.frame);  }
- (CGFloat)height    {   return CGRectGetHeight(self.frame); }

// xx
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

// yy
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

// width
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

// height
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end
