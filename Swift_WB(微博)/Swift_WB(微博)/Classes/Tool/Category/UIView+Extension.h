//
//  UIView+Extension.h
//  ScrollAndPageViw
//
//  Created by kun on 15/5/21.
//  Copyright (c) 2015年 kun. All rights reserved.
//  UIView的分类

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 *  视图的frame的坐标x值
 */
@property (nonatomic, assign) CGFloat x;
/**
 *  视图的frame的坐标y值
 */
@property (nonatomic, assign) CGFloat y;
/**
 *  视图中心点的X值
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 *  视图中心点的Y值
 */
@property (nonatomic, assign) CGFloat centerY;
/**
 *  视图的frame的宽度width
 */
@property (nonatomic, assign) CGFloat width;
/**
 *  视图的frame的高度height
 */
@property (nonatomic, assign) CGFloat height;
/**
 *  视图的size值
 */
@property (nonatomic, assign) CGSize size;
/**
 *  视图的origin值
 */
@property (nonatomic, assign) CGPoint origin;

@end
