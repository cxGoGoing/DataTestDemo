//
//  ThirdViewController.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/7.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic,weak)UICollectionView * collectionView;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
}

- (void)setUpCollectionView{
    self.view.backgroundColor = [UIColor whiteColor];

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
