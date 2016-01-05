//
//  UIImage+Image.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>
@implementation UIImage (Image)
+ (void)load {
  Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
  Method imageName = class_getClassMethod(self, @selector(imageNamed:));
  method_exchangeImplementations(imageWithName, imageName);
}
+ (instancetype)imageWithName:(NSString *)name {
  UIImage *image = [self imageWithName:name];
  if (image == nil) {
    NSLog(@"加载空的图片");
  }
  return image;
}
@end
