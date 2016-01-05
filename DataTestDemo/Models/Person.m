//
//  Person.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person
void eat(id self ,SEL sel){
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if(sel == @selector(eat)){
        class_addMethod(self, @selector(eat),eat, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}

@end
