//
//  CustomView.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/8.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [[UIColor redColor]setFill];
    CGFloat w = ceilf([UIScreen mainScreen].bounds.size.width*0.2);
    CGFloat h = ceilf([UIScreen mainScreen].bounds.size.height*0.1);
    
    UIRectFill(CGRectMake(0, 0, w, h));
}

@end
