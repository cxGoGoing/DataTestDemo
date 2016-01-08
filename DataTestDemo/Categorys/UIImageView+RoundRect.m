//
//  UIImageView+RoundRect.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/8.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "UIImageView+RoundRect.h"

@implementation UIImageView (RoundRect)
- (void)ShowWithRoundRectRadius:(CGFloat)radius{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius]addClip];
    [self.image drawInRect:self.bounds];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
@end
