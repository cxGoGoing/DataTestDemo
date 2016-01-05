//
//  Person.h
//  DataTestDemo
//
//  Created by chengxun on 16/1/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, assign) NSUInteger age;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) float height;
+ (void)eat;
@end
