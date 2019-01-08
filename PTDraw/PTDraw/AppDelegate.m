//
//  AppDelegate.m
//  PTDraw
//
//  Created by pt on 2019/1/8.
//  Copyright © 2019年 pt. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /**
     s.name: 库的名称
     s.version:版本号
     s.summary:摘要
     s.description：描述部分，要比摘要长
     s.homepage：源地址，也就是私有库对应的远程地址
     s.license:执照，一般选择默认
     s.author:作者名称
     s.platform：支持平台
     s.source：来源
     s.source_files：文件路径
     s.framework/s.frameworks:依赖的系统的framework
     s.dependency:依赖的库
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
