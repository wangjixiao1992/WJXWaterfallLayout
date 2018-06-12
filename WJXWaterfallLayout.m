//
//  WJXWaterfallLayout.m
//  WaterFallDemo
//
//  Created by wangjixiao on 2018/6/12.
//  Copyright © 2018年 lmh. All rights reserved.
//

#import "WJXWaterfallLayout.h"

@interface WJXWaterfallLayout()
//布局属性
@property (nonatomic, strong) NSMutableArray * attrsArray;
//列的当前高度
@property (nonatomic, strong) NSMutableDictionary *contentHeightDic;

@end

@implementation WJXWaterfallLayout

/**
 * 初始化 (相当于init)
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    // 初始化之前计算的所有高度
    if (self.items == 0) {
        self.items = 2;
    }
    self.contentHeightDic = nil;
    // 清楚之前所有的布局属性
    self.attrsArray = nil;
    // 开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置上cell对应的布局属性
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}
/**
 * 决定cell的高度
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 内容的高度
 */
- (CGSize)collectionViewContentSize
{
    //初始赋值第一个最短
    CGFloat maxHeight = [[self.contentHeightDic objectForKey:[NSString stringWithFormat:@"0"]] floatValue];
    for (int i = 1; i < self.items; i++) {
        CGFloat rowHeight = [[self.contentHeightDic objectForKey:[NSString stringWithFormat:@"%d", i]] floatValue];
        if (maxHeight < rowHeight) {
            maxHeight = rowHeight;
        }
    }
    maxHeight = maxHeight + self.sectionInset.bottom;
    return CGSizeMake(self.collectionView.frame.size.width, maxHeight);
}

/**
 * 返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat viewWidth = self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right;
    CGFloat offsetX = self.minimumInteritemSpacing;
    CGFloat offsetY = self.minimumLineSpacing;

    //获取cell的大小
    CGFloat layoutViewHeight = 0;
    if ([self.delegate respondsToSelector:@selector(waterFallLayout:heightForItemAtIndexPath:)]) {
        layoutViewHeight = [self.delegate waterFallLayout:self heightForItemAtIndexPath:indexPath];
    }
    
    CGFloat layoutViewWidth = (viewWidth - (self.items - 1) * offsetX) / self.items;
    // 创建布局属性
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    int row = 0;
    //初始赋值第一个最短
    CGFloat minHeight = [[self.contentHeightDic objectForKey:[NSString stringWithFormat:@"0"]] floatValue];
    for (int i = 1; i < self.items; i++) {
        CGFloat rowHeight = [[self.contentHeightDic objectForKey:[NSString stringWithFormat:@"%d", i]] floatValue];
        if (minHeight > rowHeight) {
            minHeight = rowHeight;
            row = i;
        }
    }
    CGFloat layoutWidth = layoutViewWidth;
    CGFloat layoutHeight = layoutViewHeight;
    CGFloat layoutX = self.sectionInset.left;
    if (row > 0) {
        layoutX = self.sectionInset.left + row * (layoutViewWidth + offsetX);
    }
    CGFloat layoutY = minHeight + offsetY;
    
    attrs.frame = CGRectMake(layoutX, layoutY, layoutWidth, layoutHeight);
    //更新高度
    [self.contentHeightDic setObject:[NSString stringWithFormat:@"%f", CGRectGetMaxY(attrs.frame)]
                              forKey:[NSString stringWithFormat:@"%d", row]];
    return attrs;
}

#pragma mark 懒加载
- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _attrsArray;
}

- (NSMutableDictionary *)contentHeightDic
{
    if (!_contentHeightDic) {
        _contentHeightDic = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return _contentHeightDic;
}


@end
