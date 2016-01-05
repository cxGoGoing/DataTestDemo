//
//  Person+Property.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "Person+Property.h"
#import <objc/message.h>
static const char * key = "work";
@implementation Person (Property)
- (NSString*)work{
    return objc_getAssociatedObject(self, key);
}
- (void)setWork:(NSString *)work{
    objc_setAssociatedObject(self, key, work, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
