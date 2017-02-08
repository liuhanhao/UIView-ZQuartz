//
//  TestView.m
//  UIView-ZQuartz
//
//  Created by Adsmart on 17/1/13.
//  Copyright © 2017年 Adsmart. All rights reserved.
//

#import "TestView.h"

@implementation TestView


- (void)drawRect:(CGRect)rect {
 
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx,1,0,0,1);//设置红色画笔
    CGContextMoveToPoint(ctx,110,0);
    CGContextAddLineToPoint(ctx,50,50);
//     CGContextAddLineToPoint(ctx,80,10);     //你可以去掉这一行和下面一行看看，就知道为什么我说的传入addArcToPoint方法里的参数本身不一定要绘制的原因了
//     CGContextAddLineToPoint(ctx,50,50);
    CGContextAddArcToPoint(ctx,80,10,80,110,50);
    CGContextAddLineToPoint(ctx,80,110);    //测试显示调用addArcToPoint结束后current point不在(80,110)上，而是在弧线结束的地方
    
    CGContextDrawPath(ctx, kCGPathStroke);

}


@end
