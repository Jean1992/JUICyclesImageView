//
//  UIView+JUI.h
//  JUISample
//
//  Created by 四威 on 15/12/2.
//  Copyright © 2015年 JeanKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JUI)
/**
 * x 视图左边
 **/
@property (nonatomic, assign) CGFloat x;
/**
 * y 视图顶部
 **/
@property (nonatomic, assign) CGFloat y;
/**
 * w 视图宽度
 **/
@property (nonatomic, assign) CGFloat width;
/**
 * h 视图高度
 **/
@property (nonatomic, assign) CGFloat height;
/**
 * bottom 视图底部
 **/
@property (nonatomic, assign, readonly) CGFloat bottom;
/**
 * right 视图右边
 **/
@property (nonatomic, assign, readonly) CGFloat right;
/**
 * size 视图尺寸
 **/
@property (nonatomic, assign) CGSize size;
/**
 * origin 视图位置
 **/
@property (nonatomic, assign) CGPoint origin;
/**
 * 设置视图边框宽度和颜色
 * width 边框宽度
 * color 边框颜色
 **/
- (void)JUIBoardWidth:(CGFloat)width boardColor:(UIColor *)color;
@end
