//
//  ThirdViewController.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/7.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomCollectionViewLayout.h"
#import <PureLayout.h>
@interface ThirdViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,weak)UICollectionView * collectionView;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
}

- (void)setUpCollectionView{
    self.view.backgroundColor = [UIColor whiteColor];
    CustomCollectionViewLayout * layout = [[CustomCollectionViewLayout alloc]init];
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    [collectionView autoPinEdgesToSuperviewEdges];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    self.collectionView = collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
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
