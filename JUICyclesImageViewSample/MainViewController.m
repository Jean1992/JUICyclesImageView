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
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JUICyclesImageViewSample";
    self.view.backgroundColor = [UIColor whiteColor];
//    tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //用法简单快捷==========================
    JUICyclesImageView *cycImgView = [JUICyclesImageView cyclesImageViewWithFrame:CGRectMake(0, 74, self.view.width, self.view.width * 0.5) images:_arrayImages];
    cycImgView.presentController = self;
    cycImgView.timeInterval = 3;
//    tableview.tableHeaderView = cycImgView;
    //=====================================
    [self.view addSubview:cycImgView];
}




@end
