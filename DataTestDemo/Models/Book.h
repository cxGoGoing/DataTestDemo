//
//  Book.h
//  DataTestDemo
//
//  Created by chengxun on 16/1/6.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString * const NotificationControler;/**<  通知的名称  */
@interface Book : NSObject
@property (nonatomic,copy) NSString * bookName;
@property (nonatomic,assign)float price;
@end
