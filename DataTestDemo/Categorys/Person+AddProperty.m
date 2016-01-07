//
//  Person+AddProperty.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/7.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "Person+AddProperty.h"
#import <objc/runtime.h>
static char key;
@implementation Person (AddProperty)
- (NSString*)emailAddress{
    return objc_getAssociatedObject(self, &key);
}
- (void)setEmailAddress:(NSString *)emailAddress{
    objc_setAssociatedObject(self, &key, emailAddress, OBJC_ASSOCIATION_COPY);
}
@end

