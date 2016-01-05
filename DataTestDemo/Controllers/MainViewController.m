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
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ConcurrentOperation * operation = [[ConcurrentOperation alloc]init];
    [operation start];

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
