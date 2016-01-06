//
//  SecondViewController.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/6.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"click Me" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickMe2:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
- (void)blockWithMessage:(void (^)(NSString *))messageBlock{
}
- (void)clickMe2:(UIButton*)btn{
    self.messageBlock(btn.titleLabel.text);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)clickMe:(UIButton*)btn{
  if (self.delegate &&
      [self.delegate
          respondsToSelector:@selector(secondViewController:inputMessage:)]) {
          [self.delegate secondViewController:self inputMessage:btn.titleLabel.text];
          [self.navigationController popViewControllerAnimated:YES];
          ;
  }

}
- (void)secondeVCMethod{
    NSLog(@"This is secondVc Method");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
