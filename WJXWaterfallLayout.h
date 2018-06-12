//
//  WJXWaterfallLayout.h
//  WaterFallDemo
//
//  Created by wangjixiao on 2018/6/12.
//  Copyright © 2018年 lmh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJXWaterfallLayout;

@protocol  WJXWaterfallLayoutDeleaget<NSObject>


@required
/**
 * 每个item的高度
 */
- (CGFloat)waterFallLayout:(WJXWaterfallLayout *)waterFallLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface WJXWaterfallLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSInteger items;                                 //行数

@property (nonatomic, weak) id<WJXWaterfallLayoutDeleaget> delegate;

@end
