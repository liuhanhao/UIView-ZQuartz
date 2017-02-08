//
//  ZAppDelegate.m
//  ZQuartz
//
//  Created by CocoaPods on 04/26/2015.
//  Copyright (c) 2014 zhuayi. All rights reserved.
//

#import "UIView+ZQuartz.h"

@implementation UIView (ZQuartz)

/**
 *  绘制图片
 */
- (void)drawImage:(CGRect)rect image:(UIImage *)image {
    [image drawInRect:rect];
//    CGContextRef     context = UIGraphicsGetCurrentContext();
//    CGContextDrawImage(context, rect,  image.CGImage); // 这样子画出来的 图片是个反的  需要对图片进行矩阵变换
}


/**
 *  绘制文字
 *
 *  @param point     文字左边的启始坐标
 *  @param text      文字内容
 *  @param attributes 文字样式
 */
- (void)drawText:(CGPoint)point text:(NSString *)text textAttributes:(NSDictionary *)attributes
{
    // 兼容不同长度的字符串
    [text drawAtPoint:point withAttributes:attributes];
}


/**
 *  绘制带边框线的矩形
 *
 *  @param rect      矩形尺寸
 *  @param lineWidth 边框线宽度
 *  @param lineColor     线条颜色
 *  @param fillColor     矩形的填充颜色
 */
- (void)drawRectangle:(CGRect)rect lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor {
    CGContextRef     context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    //添加矩形对象
    CGContextAddRect(context,rect);
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}


/**
 *  绘制圆角矩形
 *
 *  @param rect   矩形尺寸
 *  @param radius 圆角弧度
 */
- (void)drawRadiusRectangle:(CGRect)rect withRadius:(float)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    
    CGMutablePathRef pathRef = [self pathwithFrame:rect withRadius:radius];
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context,kCGPathFillStroke);
    
    CGPathRelease(pathRef);
}

/**
 *  绘制画多边形
 *
 *  @param pointArray 点数组 pointArray = @[[NSValue valueWithCGPoint:CGPointMake(200, 400)]];
 */
- (void)drawPolygon:(NSArray *)pointArray lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor
{
    NSAssert(pointArray.count>=2,@"数组长度必须大于等于2");
    NSAssert([[pointArray[0] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    
    NSValue *startPointValue = pointArray[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    for(int i = 1; i<pointArray.count; i++)
    {
        NSAssert([[pointArray[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
        NSValue *pointValue = pointArray[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}


/**
 *  绘制圆形
 *
 *  @param center 中心点坐标
 *  @param radius 半径
 */
- (void)drawCircleWithCenter:(CGPoint)center radius:(float)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    
    CGPathAddArc(pathRef,
                 &CGAffineTransformIdentity,
                 center.x,
                 center.y,
                 radius,
                 -M_PI/2,
                 radius*2*M_PI-M_PI/2,
                 NO);
    CGPathCloseSubpath(pathRef);
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context,kCGPathFillStroke);
    
    CGPathRelease(pathRef);
    
}


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
            lineColor:(UIColor *)lineColor
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    // 三点确定一个贝塞尔曲线
    CGContextAddCurveToPoint(context,
                             controlPoint1.x,
                             controlPoint1.y,
                             controlPoint2.x,
                             controlPoint2.y,
                             endPoint.x,
                             endPoint.y);

    CGContextDrawPath(context,kCGPathStroke);
}

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
            lineColor:(UIColor *)lineColor
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);

    // 两点确定一个贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
    CGContextDrawPath(context,kCGPathStroke);
}

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
                fillColor:(UIColor *)fillColor
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    
//    // 这个方法画弧 是需要一个当前点  点1  点2
//    // 当前点和点1构成一条直线   点1和点2构成一条直线   画出一条与两条直线相切的弧线。  只要三点不在一条直线上就一定可以画出一条弧线
//    CGContextMoveToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x#>, <#CGFloat y#>)
//    CGContextAddArcToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x1#>, <#CGFloat y1#>, <#CGFloat x2#>, <#CGFloat y2#>, <#CGFloat radius#>)
    
    // 这个方法画弧 是用圆心和半径确定 一条弧线
    CGContextAddArc(context,
                    center.x,
                    center.y,
                    radius,
                    startAngle,
                    endAngle,
                    clockwise?0:1);
    
    CGContextStrokePath(context);
}


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
                   fillColor:(UIColor *)fillColor
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context,
                    center.x,
                    center.y,
                    radius,
                    startAngle,
                    endAngle,
                    clockwise?0:1);
    CGContextClosePath(context);
    CGContextDrawPath(context,kCGPathFillStroke);
}

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
        fillColor:(UIColor *)fillColor
{
    NSAssert(pointArray.count>=2,@"数组长度必须大于等于2");
    NSAssert([[pointArray[0] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线框颜色
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    NSValue *startPointValue = pointArray[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, startPoint.x, startPoint.y);
    for (int i = 1; i < pointArray.count; i++) {
        
        NSAssert([[pointArray[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
        NSValue *pointValue = pointArray[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, point.x, point.y);
        
    }
    CGContextAddPath(context, pathRef);
    CGContextStrokePath(context);
    
    // 画圆点
    if (isRoundPoint) {
        
        for (int i = 0; i < pointArray.count; i++) {
            
            NSAssert([[pointArray[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
            NSValue *pointValue = pointArray[i];
            CGPoint  point      = [pointValue CGPointValue];
//            CGContextMoveToPoint(context, point.x, point.y);
            UIBezierPath *path = [[UIBezierPath alloc] init];
            [fillColor setFill];
            [lineColor setStroke];
            path.lineWidth = lineWidth;
            [path addArcWithCenter:point radius:radius startAngle:0 endAngle:M_PI * 360 / 180.0 clockwise:1];
            [path fill];
            [path stroke];
//            CGMutablePathRef pathRef = CGPathCreateMutable();
//            CGPathAddArc(pathRef, &CGAffineTransformIdentity, point.x, point.y, radius, 0, M_PI * 360 / 180.0, 1);
//            CGContextAddPath(context, path.CGPath);
            
        }
        
    }
    
}

/**
 *  生成矩形路径
 *
 *  @param frame  矩形尺寸
 *  @param radius 圆角弧度
 *
 *  @return CGMutablePathRef 矩形路径
 */
- (CGMutablePathRef)pathwithFrame:(CGRect)frame withRadius:(float)radius {
    CGPoint x1, x2, x3, x4; //x为4个顶点
    CGPoint y1, y2, y3, y4, y5, y6, y7, y8; //y为4个控制点
    //从左上角顶点开始，顺时针旋转,x1->y1->y2->x2
    
    x1 = frame.origin;
    x2 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y);
    x3 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y + frame.size.height);
    x4 = CGPointMake(frame.origin.x, frame.origin.y + frame.size.height);
    
    
    y1 = CGPointMake(frame.origin.x + radius, frame.origin.y);
    y2 = CGPointMake(frame.origin.x + frame.size.width - radius, frame.origin.y);
    y3 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y + radius);
    y4 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y + frame.size.height - radius);
    
    y5 = CGPointMake(frame.origin.x + frame.size.width-radius, frame.origin.y+frame.size.height);
    y6 = CGPointMake(frame.origin.x + radius, frame.origin.y + frame.size.height);
    y7 = CGPointMake(frame.origin.x, frame.origin.y + frame.size.height-radius);
    y8 = CGPointMake(frame.origin.x, frame.origin.y + radius);
    
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    if (radius<=0) {
        CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, x1.x, x1.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x2.x, x2.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x3.x, x3.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x4.x, x4.y);
    } else {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, y1.x, y1.y);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y2.x, y2.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x2.x, x2.y, y3.x, y3.y, radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y4.x, y4.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x3.x, x3.y, y5.x, y5.y, radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y6.x, y6.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x4.x, x4.y, y7.x, y7.y, radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y8.x, y8.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x1.x, x1.y, y1.x, y1.y, radius);
    }
    CGPathCloseSubpath(pathRef);
    return pathRef;
}

@end
