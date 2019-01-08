//
//  DrawRectView.m
//  DrawRectTest
//
//  Created by pt on 2018/12/5.
//  Copyright © 2018年 xr. All rights reserved.
//

#import "DrawRectView.h"
#import "UIView+DrawGraph.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@implementation DrawRectView

//draw
- (void)drawRect:(CGRect)rect{
    //画线
    [self PTDrawLineWithStartPoint:CGPointMake(10, 30) EndPoint:CGPointMake(rect.size.width-10, 30) LineColor:[UIColor redColor] LineWidth:5];
    //折线
    NSArray *zxArr = @[@[@(20),@(60)],@[@(50),@(30)],@[@(80),@(60)],@[@(110),@(40)]];
    //方法一:
    for (int i = 0; i<zxArr.count; i++) {
        NSArray *temp = zxArr[i];
        CGFloat x = [temp.firstObject floatValue];
        CGFloat y = [temp.lastObject floatValue];
        if (i!=zxArr.count-1) {
            NSArray *temp2 = zxArr[i+1];
            CGFloat ex = [temp2.firstObject floatValue];
            CGFloat ey = [temp2.lastObject floatValue];
            [self PTDrawLineWithStartPoint:CGPointMake(x, y) EndPoint:CGPointMake(ex, ey) LineColor:[UIColor orangeColor] LineWidth:10];
        }
    }
    //方法二:()
    [self PTDrawMorePointLine:zxArr Color:[UIColor greenColor] LineWidth:5 Close:NO Fill:NO];
    //三角形
    //1.填充
    NSArray *triangleArr = @[@[@(200),@(20)],@[@(170),@(85)],@[@(230),@(85)]];
    [self PTDrawMorePointLine:triangleArr Color:[UIColor redColor] LineWidth:5 Close:YES Fill:YES];
    //不填充
    [self PTDrawMorePointLine:triangleArr Color:[UIColor blueColor] LineWidth:1 Close:YES Fill:NO];
    
    //矩形(线)
    [self PTDrawPolygonWithRect:CGRectMake(50, 100, 150, 70) Color:[UIColor whiteColor] LineWidth:5 Fill:NO Type:SHAPE_RECTANGLE];
    //矩形(面)
    [self PTDrawPolygonWithRect:CGRectMake(70, 120, 110, 30) Color:[UIColor yellowColor] LineWidth:5 Fill:YES Type:SHAPE_RECTANGLE];
    
    //椭圆(线)
    [self PTDrawPolygonWithRect:CGRectMake(55, 105, 140, 60) Color:[UIColor redColor] LineWidth:5 Fill:NO Type:SHAPE_EILLPSOID];
    //椭圆(面)
    [self PTDrawPolygonWithRect:CGRectMake(70, 120, 110, 30) Color:[UIColor greenColor] LineWidth:5 Fill:YES Type:SHAPE_EILLPSOID];
    
    //圆(线) n半径是宽度的一半
    [self PTDrawPolygonWithRect:CGRectMake(200, 100, 140, 70) Color:[UIColor blueColor] LineWidth:5 Fill:NO Type:SHAPE_CIRCLE];
    //圆(面) n半径是宽度的一半
    [self PTDrawPolygonWithRect:CGRectMake(205, 105, 130, 60) Color:[UIColor redColor] LineWidth:5 Fill:YES Type:SHAPE_CIRCLE];
    
    //(角度是以顺时针方向增长的)
    //弧线(外曾)
    [self PTDrawArcWithPoint:CGPointMake(rect.size.width/2, rect.size.height/2) Radius:50 StartAngle:0 EndAngle:M_PI*0.75 ClockWise:0 Fill:NO Color:[UIColor orangeColor] LineWidth:10];
    
    //弧面(内切)
    [self PTDrawArcWithPoint:CGPointMake(rect.size.width/2, rect.size.height/2) Radius:55 StartAngle:0 EndAngle:M_PI*0.75 ClockWise:1 Fill:YES Color:[UIColor greenColor] LineWidth:5];
    
    
    //圆(面) n半径是宽度的一半
    [self PTDrawPolygonWithRect:CGRectMake(100-5,300-5, 10, 10) Color:[UIColor greenColor] LineWidth:0 Fill:YES Type:SHAPE_CIRCLE];
    [self PTDrawPolygonWithRect:CGRectMake(100-5,200-5, 10, 10) Color:[UIColor greenColor] LineWidth:0 Fill:YES Type:SHAPE_CIRCLE];
    [self PTDrawPolygonWithRect:CGRectMake(280-5,200-5, 10, 10) Color:[UIColor greenColor] LineWidth:0 Fill:YES Type:SHAPE_CIRCLE];
    
    //弧线与当前点到点(x1, y1)连线相切，且与点(x1, y1)到点(x2, y2)连线相切
    //起始点->p1->p2 画线为起始点->p1(内切圆)
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 100, 300);
    CGContextAddArcToPoint(context, 100, 200, 280, 200, 40);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextDrawPath(context, kCGPathStroke);
    [self PTDrawMorePointLine:@[@[@(100),@(300)],@[@(100),@(200)],@[@(280),@(200)]] Color:[UIColor blueColor] LineWidth:2 Close:NO Fill:NO];
    
    
    //贝塞尔曲线
    NSArray *arr = @[@[@(0),@(450)],@[@(30),@(250)],@[@(50),@(350)],@[@(70),@(150)],@[@(90),@(280)],@[@(110),@(140)],@[@(130),@(450)],@[@(150),@(280)],@[@(170),@(580)]];
    [self PTDrawBezierLineWithPointArr:arr Color:[UIColor yellowColor] LineWidth:4];
    
    
    //CADisplayLink & CAShapeLayer
//    CADisplayLink 
}

@end
