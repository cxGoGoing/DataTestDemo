//
//  MainViewController.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/4.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "MainViewController.h"
#import "NonConcurrentOperation.h"
#import "ConcurrentOperation.h"
#import <PureLayout.h>
#import "UIColor+Image.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
}
/**  用纯色画图片  */
- (void)createImageWithColor{
    UIImageView * imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    [imageView autoCenterInSuperview];
    [imageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    imageView.image = [UIColor createImageWith:[UIColor yellowColor]];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
/**  异步执行这个操作  */
- (void)concurrentOperation{
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    ConcurrentOperation * operation = [[ConcurrentOperation alloc]init];
    [queue addOperation:operation];
}

- (void)nonConcurrentOperation{
    NonConcurrentOperation * operation = [[NonConcurrentOperation alloc]init];
    [operation start];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
