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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3);
    CGContextMoveToPoint(context, 10, 100);
    CGContextAddLineToPoint(context, 200, 100);
    CGContextStrokePath(context);

    CGContextMoveToPoint(context, 10, 105.5);
    CGContextAddLineToPoint(context, 200, 105.5);
    CGContextStrokePath(context);


}

@end
