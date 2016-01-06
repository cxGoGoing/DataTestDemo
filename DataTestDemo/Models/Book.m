//
//  Book.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/6.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "Book.h"
NSString * const NotificationControler = @"NotificationControler";
@implementation Book
- (instancetype)init {
  if (self = [super init]) {
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(notification)
                                   userInfo:nil
                                    repeats:YES];
  }
  return self;
}
- (void)notification{
  static int sumJI = 10;
  sumJI -= 1;
  [[NSNotificationCenter defaultCenter]
      postNotificationName:NotificationControler
                    object:@(sumJI)
                  userInfo:@{
                    @"🐔主" : @"Steven"
                  }];
}
@end
