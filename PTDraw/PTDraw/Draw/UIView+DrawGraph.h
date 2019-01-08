//
//  UIView+DrawGraph.h
//  DrawRectTest
//
//  Created by pt on 2018/12/5.
//  Copyright © 2018年 xr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, shapeTpey) {
    SHAPE_RECTANGLE,//矩形
    SHAPE_CIRCLE,//圆
    SHAPE_EILLPSOID,//椭圆
};

@interface UIView (DrawGraph)
/** 线条绘制
 @param start 起始点
 @param end 终点
 @param lineColor 线条颜色
 @param lineWidth 线条宽度
 */
- (void)PTDrawLineWithStartPoint:(CGPoint)start EndPoint:(CGPoint)end LineColor:(UIColor *)lineColor LineWidth:(CGFloat)lineWidth;

/** 多点线条绘制(多变形/折线)
 @param linePointArr 点数组obj=@[(x,y)]
 @param close 是否闭合
 @param color 线条/填充颜色
 @param lineWidth 线条宽度
 @param fill 是否填充
 */
- (void)PTDrawMorePointLine:(NSArray *)linePointArr Color:(UIColor *)color LineWidth:(CGFloat)lineWidth Close:(BOOL)close Fill:(BOOL)fill;

/** 矩形/圆形/椭圆绘制
 @param rect 位置(圆的时候r=w/2)
 @param shapeType 类型
 @param color 线条/填充颜色
 @param lineWidth 线条宽度
 @param fill 是否填充
 */
- (void)PTDrawPolygonWithRect:(CGRect)rect Color:(UIColor *)color LineWidth:(CGFloat)lineWidth Fill:(BOOL)fill Type:(shapeTpey)shapeType;

/** 弧形
 @param point 位置
 @param radius 半径
 @param color 线条/填充颜色
 @param lineWidth 线条宽度
 @param fill 是否填充
 @param closewise 0 顺时针 1 逆时针
 @param s_angele 起始角度
 @param e_angele 结束角度
 */
- (void)PTDrawArcWithPoint:(CGPoint)point Radius:(CGFloat)radius StartAngle:(CGFloat)s_angele EndAngle:(CGFloat)e_angele ClockWise:(int)closewise Fill:(BOOL)fill Color:(UIColor *)color LineWidth:(CGFloat)lineWidth;

/** 贝塞尔曲线
 @param linePointArr 点数组obj=@[(x,y)]
 @param color 线条/填充颜色
 @param lineWidth 线条宽度
 */
- (void)PTDrawBezierLineWithPointArr:(NSArray *)linePointArr Color:(UIColor *)color LineWidth:(CGFloat)lineWidth;
@end

NS_ASSUME_NONNULL_END
