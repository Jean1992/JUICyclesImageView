//
//  AppDelegate.m
//  JUICyclesImageViewSample
//
//  Created by 四威 on 16/1/14.
//  Copyright © 2016年 梁晋杰. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = ({
        UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        win.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
        [win makeKeyAndVisible];
        win;
    });
    return YES;
}
@end
