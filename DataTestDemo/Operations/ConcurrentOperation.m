//
//  ConcurrentOperation.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ConcurrentOperation.h"

typedef NS_ENUM(NSInteger,ConcurrentOperationState){/**< 执行的状态  */
    ConcurrentOperationStateReady = 1,
    ConcurrentOperationStateExecuting,
    ConcurrentOperationStateFinished
};
@interface ConcurrentOperation()
@property (nonatomic,assign)ConcurrentOperationState state;
@end
@implementation ConcurrentOperation
- (BOOL)isReady{
    self.state = ConcurrentOperationStateReady;
    return self.state == ConcurrentOperationStateReady;
}
- (BOOL)isExecuting{
    return self.state == ConcurrentOperationStateExecuting;
}

- (BOOL)isFinished{
    return self.state == ConcurrentOperationStateFinished;
}

- (void)start{
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf willChangeValueForKey:@"isFinished"];
        weakSelf.state = ConcurrentOperationStateFinished;
        [weakSelf didChangeValueForKey:@"isFinished"];
        NSLog(@"finished:%@",weakSelf);
    });
    NSLog(@"start called");
    [weakSelf willChangeValueForKey:@"isExecuting"];
    weakSelf.state = ConcurrentOperationStateExecuting;
    [weakSelf didChangeValueForKey:@"isExecuting"];
}

- (void)dealloc{
    NSLog(@"dealloc called");
}
@end
