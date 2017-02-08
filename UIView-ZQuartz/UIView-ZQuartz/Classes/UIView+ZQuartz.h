//
//  UIView+ZXQuartz.h
//  quartz
//
//  Created by 张 玺 on 12-12-24.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZQuartz)

/**
 *  绘制图片
 */
- (void)drawImage:(CGRect)rect image:(UIImage *)image;


/**
 *  绘制文字
 *
 *  @param point     文字左边的启始坐标
 *  @param text      文字内容
 *  @param attributes 文字样式
 */
- (void)drawText:(CGPoint)point text:(NSString *)text textAttributes:(NSDictionary *)attributes;

/**
 *  绘制带边框线的矩形
 *
 *  @param rect      矩形尺寸
 *  @param lineWidth 边框线宽度
 *  @param lineColor     线条颜色
 *  @param fillColor     矩形的填充颜色 
 */
- (void)drawRectangle:(CGRect)rect lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor;

/**
 *  绘制圆角矩形
 *
 *  @param rect   矩形尺寸
 *  @param radius 圆角弧度
 */
- (void)drawRadiusRectangle:(CGRect)rect withRadius:(float)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor;



/**
 *  绘制画多边形
 *
 *  @param pointArray 点数组 pointArray = @[[NSValue valueWithCGPoint:CGPointMake(200, 400)]];
 */
- (void)drawPolygon:(NSArray *)pointArray lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor;


/**
 *  绘制圆形
 *
 *  @param center 中心点坐标
 *  @param radius 半径
 */
- (void)drawCircleWithCenter:(CGPoint)center radius:(float)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor;


/**
 *  三点绘制贝塞尔曲线
 *
 *  @param startPoint 开始点
 *  @param endPoint 结束点
 *  @param controlPoint1 第一个切点
 *  @param controlPoint2 第二个切点
 */
- (void)drawCurveFrom:(CGPoint)startPoint
                   to:(CGPoint)endPoint
        controlPoint1:(CGPoint)controlPoint1
        controlPoint2:(CGPoint)controlPoint2
            lineWidth:(CGFloat)lineWidth
            lineColor:(UIColor *)lineColor;

/**
 *  两点绘制贝塞尔曲线
 *
 *  @param startPoint 开始点
 *  @param endPoint 结束点
 *  @param controlPoint 第一个切点
 */
- (void)drawCurveFrom:(CGPoint)startPoint
                   to:(CGPoint)endPoint
         controlPoint:(CGPoint)controlPoint
            lineWidth:(CGFloat)lineWidth
            lineColor:(UIColor *)lineColor;

/**
 *  绘制弧线
 *
 *  @param center 圆心
 *  @param radius 半径
 *  @param startAngle 开始角度
 *  @param endAngle 结束角度
 *  @param clockwise 方向
 */
- (void)drawArcFromCenter:(CGPoint)center
                   radius:(float)radius
               startAngle:(float)startAngle
                 endAngle:(float)endAngle
                clockwise:(BOOL)clockwise
                lineWidth:(CGFloat)lineWidth
                lineColor:(UIColor *)lineColor
                fillColor:(UIColor *)fillColor;


/**
 *  绘制扇形
 *
 *  @param center 圆心
 *  @param radius 半径
 *  @param startAngle 开始角度
 *  @param endAngle 结束角度
 *  @param clockwise 方向
 */
- (void)drawSectorFromCenter:(CGPoint)center
                      radius:(float)radius
                  startAngle:(float)startAngle
                    endAngle:(float)endAngle
                   clockwise:(BOOL)clockwise
                   lineWidth:(CGFloat)lineWidth
                   lineColor:(UIColor *)lineColor
                   fillColor:(UIColor *)fillColor;

/**
 *  绘制折线 ，连续直线
 *
 *  @param pointArray pointArray = @[[NSValue valueWithCGPoint:CGPointMake(200, 400)]];
 *  @param isRoundPoint 是否需要圆圈
 */
- (void)drawLines:(NSArray *)pointArray
     isRoundPoint:(BOOL)isRoundPoint
           radius:(float)radius
        lineWidth:(CGFloat)lineWidth
        lineColor:(UIColor *)lineColor
        fillColor:(UIColor *)fillColor;


/**
 *  绘制圆角矩形直线
 */
- (CGMutablePathRef)pathwithFrame:(CGRect)frame withRadius:(float)radius;


@end
