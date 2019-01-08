//
//  UIView+DrawGraph.m
//  DrawRectTest
//
//  Created by pt on 2018/12/5.
//  Copyright © 2018年 xr. All rights reserved.
//

#import "UIView+DrawGraph.h"

@implementation UIView (DrawGraph)
//绘制线条
- (void)PTDrawLineWithStartPoint:(CGPoint)start EndPoint:(CGPoint)end LineColor:(UIColor *)lineColor LineWidth:(CGFloat)lineWidth{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineCap(context,kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextMoveToPoint(context, start.x, start.y);
    CGContextAddLineToPoint(context, end.x, end.y);
    CGContextStrokePath(context);
}
//多点绘制
- (void)PTDrawMorePointLine:(NSArray *)linePointArr Color:(UIColor *)lineColor LineWidth:(CGFloat)lineWidth Close:(BOOL)close Fill:(BOOL)fill{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineCap(context,kCGLineCapRound);
    if (linePointArr.count>1) {
        CGPoint start = CGPointMake([linePointArr.firstObject[0] floatValue], [linePointArr.firstObject[1] floatValue]);
        CGContextMoveToPoint(context, start.x, start.y);
        for (int i = 1; i<linePointArr.count; i++) {
            CGPoint end = CGPointMake([linePointArr[i][0] floatValue], [linePointArr[i][1] floatValue]);
            CGContextAddLineToPoint(context, end.x, end.y);
        }
    }
    if (close && linePointArr.count>2) {
        //三点及以上 且填充
        CGContextClosePath(context);
    }
    if (fill && linePointArr.count>2 && close) {
        //三点及以上 且填充
        CGContextSetFillColorWithColor(context, lineColor.CGColor);
        CGContextFillPath(context);
    }else{
        CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
        CGContextStrokePath(context);
    }
}
//绘制矩形/圆形/椭圆
- (void)PTDrawPolygonWithRect:(CGRect)rect Color:(UIColor *)color LineWidth:(CGFloat)lineWidth Fill:(BOOL)fill Type:(shapeTpey)shapeType{
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (fill) {
        CGContextSetFillColorWithColor(context, color.CGColor);
    }else{
        CGContextSetLineWidth(context, lineWidth);
        CGContextSetStrokeColorWithColor(context, color.CGColor);
    }
    if (shapeType==SHAPE_RECTANGLE) {
        //矩形
        CGContextAddRect(context, rect);
        if (fill) {
            CGContextFillPath(context);
        }else{
            CGContextStrokePath(context);
        }
    }else{
        if (shapeType==SHAPE_CIRCLE){
            rect = CGRectMake(rect.origin.x,rect.origin.y, rect.size.width, rect.size.width);//圆(长宽相等)
        }
        CGContextAddEllipseInRect(context,rect);//椭圆
        CGPathDrawingMode drawMode = kCGPathStroke;
        if (fill) {
            drawMode = kCGPathFill;
        }
        CGContextDrawPath(context,drawMode);
    }
}
//画弧线
- (void)PTDrawArcWithPoint:(CGPoint)point Radius:(CGFloat)radius StartAngle:(CGFloat)s_angele EndAngle:(CGFloat)e_angele ClockWise:(int)closewise Fill:(BOOL)fill Color:(UIColor *)color LineWidth:(CGFloat)lineWidth{
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextAddArc(context, point.x, point.y, radius, s_angele, e_angele, closewise);
    
    if (fill) {
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextDrawPath(context, kCGPathFill);
    }else{
        CGContextSetLineWidth(context, lineWidth);
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }
    
}
//画贝塞尔曲线
- (void)PTDrawBezierLineWithPointArr:(NSArray *)linePointArr Color:(UIColor *)color LineWidth:(CGFloat)lineWidth{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGPoint Start = CGPointZero;
    if (linePointArr.count>1) {
        CGPoint start = CGPointMake([linePointArr.firstObject[0] floatValue], [linePointArr.firstObject[1] floatValue]);
        Start = start;
        CGContextMoveToPoint(context, start.x, start.y);
        for (int i = 1; i<linePointArr.count; i++) {
            CGPoint end = CGPointMake([linePointArr[i][0] floatValue], [linePointArr[i][1] floatValue]);
            
            CGFloat cpx = (Start.x + end.x)/2;
            
            //设置贝塞尔曲线的控制点坐标和终点坐标
            CGContextAddCurveToPoint(context, cpx, Start.y, cpx, end.y, end.x, end.y);//三
            Start = end;
        }
    }
    CGContextStrokePath(context);
}
@end
