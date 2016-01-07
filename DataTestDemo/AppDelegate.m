//
//  AppDelegate.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/4.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController * mainVc = [[MainViewController alloc]init];
    UINavigationController * naviVc = [[UINavigationController alloc]initWithRootViewController:mainVc];
    self.window.rootViewController = naviVc;
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
  if ([pasteBoard.string hasPrefix:@"http://"] ||
      [pasteBoard.string hasPrefix:@"https://"]) {
    UIAlertController *alertVc = [UIAlertController
        alertControllerWithTitle:@"要打开其中的链接吗？"
                         message:nil
                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionConfirm =
        [UIAlertAction actionWithTitle:@"打开"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *_Nonnull action) {
                                 NSLog(@"打开链接");
                               }];
    UIAlertAction *actionRefuse =
        [UIAlertAction actionWithTitle:@"忽略"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *_Nonnull action) {
                                 NSLog(@"忽略");
                                 pasteBoard.string = @"";
                               }];
    [alertVc addAction:actionConfirm];
    [alertVc addAction:actionRefuse];
    [self.window.rootViewController presentViewController:alertVc
                                                 animated:YES
                                               completion:nil];
  }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
