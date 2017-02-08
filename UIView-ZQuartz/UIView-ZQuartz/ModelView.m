//
//  ModelView.m
//  UIView-ZQuartz
//
//  Created by Adsmart on 17/1/11.
//  Copyright © 2017年 Adsmart. All rights reserved.
//

#import "ModelView.h"
#import "UIView+ZQuartz.h"

@implementation ModelView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.type = -1;
    }
    
    return self;
}

- (void)setType:(NSInteger)type {
    
    _type = type;
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    
    switch (_type) {
        case 0:
        {
            [self drawImage:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) image:[UIImage imageNamed:@"QQ20170111-0.png"]];
            break;
        }
        case 1:
        {
            [self drawText:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0) text:@"草泥马" textAttributes:nil];
            break;
        }
        case 2:
        {
            [self drawRectangle:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) lineWidth:5.0f lineColor:[UIColor redColor] fillColor:[UIColor purpleColor]];
            break;
        }
        case 3:
        {
            [self drawRadiusRectangle:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) withRadius:50.0f lineWidth:5.0f lineColor:[UIColor redColor] fillColor:[UIColor redColor]];
            break;
        }
        case 4:
        {
            NSArray *array = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)],[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width, 0)],[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width, self.frame.size.height)],[NSValue valueWithCGPoint:CGPointMake(0, self.frame.size.height)]];
            [self drawPolygon:array lineWidth:5.0f lineColor:[UIColor redColor] fillColor:[UIColor purpleColor]];
            break;
        }
        case 5:
        {
            [self drawCircleWithCenter:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0) radius:self.frame.size.width / 2 - 5.0f lineWidth:5.0f lineColor:[UIColor redColor] fillColor:[UIColor purpleColor]];
            break;
        }
        case 6:
        {
            UIImage *image = [UIImage imageNamed:@"QQ20170114-0.png"];
            CGFloat height = self.frame.size.width / image.size.width * image.size.height;
            [self drawImage:CGRectMake(0, 0, self.frame.size.width, height) image:image];
            [self drawCurveFrom:CGPointMake(0, self.frame.size.height / 2.0) to:CGPointMake(self.frame.size.width, self.frame.size.height / 2.0) controlPoint1:CGPointMake(self.frame.size.width / 2.0, 0) controlPoint2:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height) lineWidth:5.0f lineColor:[UIColor redColor]];
            break;
        }
        case 7:
        {
            UIImage *image = [UIImage imageNamed:@"QQ20170114-1.png"];
            CGFloat height = self.frame.size.width / image.size.width * image.size.height;
            [self drawImage:CGRectMake(0, 0, self.frame.size.width, height) image:image];
            [self drawCurveFrom:CGPointMake(0, self.frame.size.height / 2.0) to:CGPointMake(self.frame.size.width, self.frame.size.height / 2.0) controlPoint:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height) lineWidth:5.0f lineColor:[UIColor redColor]];
            break;
        }
        case 8:
        {
            [self drawArcFromCenter:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0) radius:100 startAngle:M_PI * 0 / 180.0 endAngle:M_PI * 90 / 180.0 clockwise:YES lineWidth:5.0f lineColor:[UIColor redColor] fillColor:[UIColor blueColor]];
            break;
        }
        case 9:
        {
            [self drawSectorFromCenter:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0) radius:100 startAngle:M_PI * 0 / 180.0 endAngle:M_PI * 90 / 180.0 clockwise:YES lineWidth:5.0f lineColor:[UIColor redColor] fillColor:[UIColor blueColor]];
            break;
        }
        case 10:
        {
            NSArray *array = @[[NSValue valueWithCGPoint:CGPointMake(4, 4)],[NSValue valueWithCGPoint:CGPointMake(4, self.frame.size.height - 4)],[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width - 4, 4)],[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width - 4, self.frame.size.height - 4)]];
            [self drawLines:array isRoundPoint:YES radius:4.0f lineWidth:1.0f lineColor:[UIColor redColor] fillColor:[UIColor redColor]];
            break;
        }
        default:
            break;
    }
    
}


@end
