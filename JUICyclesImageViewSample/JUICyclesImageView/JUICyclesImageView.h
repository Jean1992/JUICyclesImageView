//
//  JUICyclesImageView.h
//  JNews
//
//  Created by 四威 on 16/1/14.
//  Copyright © 2016年 梁晋杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+JUI.h"
#import "UIImageView+WebCache.h"

@class JUICyclesImageView;
@protocol JUICyclesImageViewDelegate <NSObject>
/**
 *  点击图片回调
 *
 *  @param index   图片索引
 */
- (void)cyclesImageView:(JUICyclesImageView *)CyclesImageView didClickImageAtIndex:(NSInteger)index;

@end

@interface JUICyclesImageView : UIView
/**
 *  图片地址集合
 */
@property (nonatomic, strong) NSArray *Images;
/**
 *  自定义构造方法
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images;

+ (instancetype)cyclesImageViewWithFrame:(CGRect)frame images:(NSArray *)images;
/**
 *  轮播频率(次/秒)
 */
@property (nonatomic, assign) CGFloat timeInterval;
/**
 * delegate 代理属性
 **/
@property (nonatomic, weak) id<JUICyclesImageViewDelegate>delegate;

@end
