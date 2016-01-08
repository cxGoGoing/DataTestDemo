//
//  CustomView.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/8.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "CustomView.h"
/**  增加内联函数  */
static inline CGAffineTransform CGAffineTransformMakeScaleTranslate(CGFloat sx,CGFloat sy,CGFloat dx,CGFloat dy){
    return CGAffineTransformMake(sx, 0.f, 0.f, sy, dx, dy);
}
@implementation CustomView
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    

}

- (void)drawTwoLine{
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
