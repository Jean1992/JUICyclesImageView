//
//  MainViewController.m
//  JUICyclesImageViewSample
//
//  Created by 四威 on 16/1/14.
//  Copyright © 2016年 梁晋杰. All rights reserved.
//

#import "MainViewController.h"
#import "JUICyclesImageView.h"

@interface MainViewController () {
    UITableView *tableview;
}
@property (nonatomic) NSArray *arrayImages;
@property (nonatomic, strong) NSMutableArray *arrayImagesLocal;
@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrayImages = @[
                         @"http://img.61gequ.com/allimg/2011-4/201142614314278502.jpg",
                         @"http://img3.3lian.com/2013/s1/20/d/57.jpg",
                         @"http://img3.3lian.com/2013/s1/21/d/77.jpg",
                         @"http://img3.3lian.com/2013/s1/14/d/51.jpg",
                         @"http://img3.3lian.com/2014/c1/51/d/34.jpg"
                         ];
        //本地演示图片可能较为模糊, 是图片本身的问题
        _arrayImagesLocal = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            NSString *str = [NSString stringWithFormat:@"%02d", i];
            [_arrayImagesLocal addObject:str];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JUICyclesImageViewSample";
    self.view.backgroundColor = [UIColor whiteColor];
//异步加载网络图片
    JUICyclesImageView *cycImgView = [JUICyclesImageView cyclesImageViewWithFrame:CGRectMake(0, 74, self.view.width, self.view.width * 0.5) images:_arrayImages];
    cycImgView.presentController = self;
    cycImgView.timeInterval = 3;
    [self.view addSubview:cycImgView];
    
//加载本地图片(图片数组只需传入图片名字字符串)
    cycImgView = [JUICyclesImageView cyclesImageViewWithLocalFrame:CGRectMake(0, 74 + self.view.width * 0.5 + 20, self.view.width, self.view.width * 0.5) images:_arrayImagesLocal];
    cycImgView.presentController = self;
    cycImgView.timeInterval = 3;
    [self.view addSubview:cycImgView];
    
    
    
    
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, cycImgView.bottom + 30, cycImgView.width - 20, 100)];
    lbl.text = @"控件2为本地图片, 本地演示图片比较模糊, 是图片自身问题, 只做参考";
    lbl.numberOfLines = 0;
    lbl.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:lbl];
}




@end
