//
//  JUICyclesImageView.m
//  JNews
//
//  Created by 四威 on 16/1/14.
//  Copyright © 2016年 梁晋杰. All rights reserved.
//

#import "JUICyclesImageView.h"
#define KCyclesCount 3
/**
  滚动方向
 */
typedef enum {
    JUIScrollDirectionLeft, //向左
    JUIScrollDirectionRight //向右
}JUIScrollDirection;

@interface JUICyclesImageView () <UIScrollViewDelegate>{
    UIScrollView *contentView; //滚动视图
    CGFloat offsetX; //视图当前X偏移量
    UIImageView *centerImgView, *leftImgView, *rightImgView; //左中右三个图片框
    JUIScrollDirection scrollDirection; //滚动方向
    NSInteger currentIndex, leftIndex, rightIndex; //左中右三个图片索引
    UIPageControl *pageCtr; //页码指示器
}
/**
 *  图片地址集合
 */
@property (nonatomic, strong) NSArray *arrImgs;
@end

@implementation JUICyclesImageView
#pragma mark - 覆盖父类方法
- (instancetype)init {
    if (self = [super init]) {
        [self initializeWithImages:nil];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeWithImages:nil];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame]) {
        [self initializeWithImages:nil];
    }
    return self;
}
#pragma mark - 自定义构造方法
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray*)images {
    if (self = [super initWithFrame:frame]) {
        [self initializeWithImages:images];
    }
    return self;
}
+ (instancetype)cyclesImageViewWithFrame:(CGRect)frame images:(NSArray *)images {
    return [[self alloc] initWithFrame:frame images:images];
}
- (void)setTimeInterval:(CGFloat)timeInterval {
    _timeInterval = (timeInterval >= 0) ? timeInterval : 0;
    [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(moveInCycles) userInfo:nil repeats:YES];
}
#pragma mark - 初始化
- (void)initializeWithImages:(NSArray*)images {
    _arrImgs = images && images.count ? images : _Images;
    [self setupSubviews];
    [self setupData];
}
/**
 *  初始化控件
 */
- (void)setupSubviews {
    contentView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:contentView];
    contentView.pagingEnabled = YES;
    CGFloat iLeft = 0;
    for (int i = 0; i < KCyclesCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(iLeft, 0, contentView.width, contentView.height)];
        imgView.tag = 100 + i;
        imgView.userInteractionEnabled = YES;
        [contentView addSubview:imgView];
        [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDidClick)]];
        iLeft += contentView.width;
    }
    contentView.bounces = NO;
    contentView.delegate = self;
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.contentSize = CGSizeMake(contentView.width * KCyclesCount, 0);
    [contentView setContentOffset:CGPointMake(contentView.width, 0) animated:YES];
    CGFloat pW = _arrImgs.count * 15, pH = 20, pX = self.width - pW - 15, pY = self.height - pH - 10;
    pageCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(pX, pY, pW, pH)];
    pageCtr.pageIndicatorTintColor = [UIColor darkGrayColor];
    pageCtr.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageCtr.numberOfPages = _arrImgs.count;
    [self addSubview:pageCtr];
}
/**
 *  初始化数据
 */
- (void)setupData {
    leftImgView = [contentView viewWithTag:100];
    centerImgView = [contentView viewWithTag:101];
    rightImgView = [contentView viewWithTag:102];
    [centerImgView sd_setImageWithURL:[NSURL URLWithString:_arrImgs.firstObject]];
    [leftImgView sd_setImageWithURL:[NSURL URLWithString:_arrImgs.lastObject]];
    [rightImgView sd_setImageWithURL:[NSURL URLWithString:_arrImgs[1]]];
    currentIndex = 0;
    leftIndex = _arrImgs.count - 1;
    rightIndex = 1;
}
#pragma mark - 执行轮播
- (void)moveInCycles {
    [contentView setContentOffset:CGPointMake(contentView.width * 2, 0) animated:YES];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    offsetX = contentView.contentOffset.x;
    //判断当前滚动方向
    if (offsetX > contentView.width) {
        scrollDirection = JUIScrollDirectionRight;
    }else if(offsetX < contentView.width){
        scrollDirection = JUIScrollDirectionLeft;
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self judgeScrollDirectionEvent];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        //判断方向执行事件
        [self judgeScrollDirectionEvent];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //判断方向执行事件
    [self judgeScrollDirectionEvent];
}
#pragma mark - 判断方向执行事件
- (void)judgeScrollDirectionEvent {
    [contentView setContentOffset:CGPointMake(contentView.width, 0) animated:NO];
    switch (scrollDirection) {
        case JUIScrollDirectionLeft:
            [self imageViewScrollToLeft];
            break;
        case JUIScrollDirectionRight:
            [self imageViewScrollToRight];
            break;
        default:
            break;
    }
    [UIView animateWithDuration:0.2 animations:^{
        pageCtr.currentPage = currentIndex;
    }];
}
//视图左滚
- (void)imageViewScrollToLeft {
    currentIndex = [self changeIndexHandle:currentIndex isLeft:YES];
    leftIndex = [self changeIndexHandle:leftIndex isLeft:YES];
    rightIndex = [self changeIndexHandle:rightIndex isLeft:YES];
    [self changeImage];
}
//视图右滚
- (void)imageViewScrollToRight {
    currentIndex = [self changeIndexHandle:currentIndex isLeft:NO];
    leftIndex = [self changeIndexHandle:leftIndex isLeft:NO];
    rightIndex = [self changeIndexHandle:rightIndex isLeft:NO];
    [self changeImage];
}
//改变三个索引
- (CGFloat)changeIndexHandle:(NSInteger)index isLeft:(BOOL)isLeft {
    if (isLeft) {
        if (index - 1 < 0) {
            index = _arrImgs.count - 1;
        }else {
            index--;
        }
    }else {
        if (index + 1 > _arrImgs.count -1) {
            index = 0;
        }else {
            index++;
        }
    }
    return index;
}
//改变三张图片顺序
- (void)changeImage {
    [centerImgView sd_setImageWithURL:[NSURL URLWithString:_arrImgs[currentIndex]]];
    [leftImgView sd_setImageWithURL:[NSURL URLWithString:_arrImgs[leftIndex]]];
    [rightImgView sd_setImageWithURL:[NSURL URLWithString:_arrImgs[rightIndex]]];
}
#pragma mark - 委托事件(点击图片)
- (void)imageDidClick {
    if ([self.delegate respondsToSelector:@selector(cyclesImageView:didClickImageAtIndex:)]) {
        [self.delegate cyclesImageView:self didClickImageAtIndex:currentIndex];
    }
}
@end
