//
//  UIView+Extension.m
//  ScrollAndPageViw
//
//  Created by kun on 15/5/21.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
/** 实现getter和setter方法 */

/**
 *  视图的frame的坐标x值
 */
- (CGFloat)x
{
    CGRect frame = self.frame;
    return frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

/**
 *  视图的frame的坐标y值
 */
- (CGFloat)y
{
    CGRect frame = self.frame;
    return frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

/**
 *  视图中心点的X值
 */
- (CGFloat)centerX
{
    CGPoint center = self.center;
    return center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

/**
 *  视图中心点的Y值
 */
- (CGFloat)centerY
{
    CGPoint center = self.center;
    return center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

/**
 *  视图的frame的宽度width
 */
- (CGFloat)width
{
    CGRect frame = self.frame;
    return frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/**
 *  视图的frame的高度height
 */
- (CGFloat)height
{
    CGRect frame = self.frame;
    return frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

/**
 *  视图的origin值
 */
- (CGPoint)origin
{
    CGRect frame = self.frame;
    return frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
/**
 *  视图的size值
 */
- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
@end
