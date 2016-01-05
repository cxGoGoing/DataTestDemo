//
//  NonConcurrentOperation.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "NonConcurrentOperation.h"

@implementation NonConcurrentOperation
- (void)main{
    NSLog(@"%s---%@",__func__,NSStringFromClass([self class]));
    __weak __typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"weakSelf:%@",weakSelf);
    });
}
- (void)dealloc{
    NSLog(@"dealloc");
}
@end
