//
//  Publish.h
//  DataTestDemo
//
//  Created by chengxun on 16/1/6.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;
@interface Publish : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * boss;
@property (nonatomic,strong)Book * book;
- (void)logTestStr;
@end
