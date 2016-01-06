//
//  SecondViewController.h
//  DataTestDemo
//
//  Created by chengxun on 16/1/6.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondViewController;
@protocol SecondViewControllerDelegate<NSObject>
- (void)secondViewController:(SecondViewController*)secondVc inputMessage:(NSString*)message;


@end
@interface SecondViewController : UIViewController
@property (nonatomic,weak)id<SecondViewControllerDelegate>delegate;

@end
