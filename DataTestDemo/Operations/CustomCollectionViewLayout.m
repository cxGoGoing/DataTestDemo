//
//  CustomCollectionViewLayout.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/7.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "CustomCollectionViewLayout.h"
CGFloat const kItemDimensionWidth = 20;
CGFloat const kItemDimensionHeight = 20;
@implementation CustomCollectionViewLayout
/**  每次重新布局时就会调用这个方法  */
- (void)prepareLayout{
    [super prepareLayout];
    CGSize size = self.collectionView.bounds.size;
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    self.center = CGPointMake(size.width*0.5, size.height*0.5);
    self.radius = MIN(size.width, size.height)*0.5;
}
/**  当布局改变时就开始重绘页面  */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
/**  返回当天item的属性的数组  */
- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray * attArray = [NSMutableArray array];
    for(NSInteger i = 0;i<self.cellCount;i++){
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [attArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attArray;
}
/**  返回对应indexPath的LayoutAttributes  */
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
  UICollectionViewLayoutAttributes *attributes =
      [UICollectionViewLayoutAttributes
          layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(kItemDimensionWidth, kItemDimensionHeight);
    CGFloat attX = self.center.x+self.radius*cosf(2*indexPath.item*M_PI/self.cellCount-M_PI_2);
    CGFloat attY = self.center.y+self.radius*cosf(2*indexPath.item*M_PI/self.cellCount-M_PI_2);
    attributes.center = CGPointMake(attX, attY);
    attributes.transform3D = CATransform3DMakeRotation(2*M_PI*indexPath.item, 0, 0, 1);
    return attributes;

}
/**  返回所有从collectionView的大小 */
- (CGSize)collectionViewContentSize{
    CGRect bounds = [[self collectionView]bounds];
    return bounds.size;
}

@end
