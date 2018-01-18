//
//  cyView.m
//  Quartz2DUITest
//
//  Created by 叶子 on 2018/1/18.
//  Copyright © 2018年 叶义峰. All rights reserved.
//

#import "cyView.h"

@implementation cyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  
    UIImage * image = [UIImage imageNamed:@"1"];
    [image drawInRect:CGRectMake(20, 20, 100, 100)];// 按照frame显示大小
//    [image drawAtPoint:CGPointMake(20, 20)]; // 以这个坐标起点，到view的边缘
//    [image drawAsPatternInRect:CGRectMake(0, 0, 100, 100)];// 如果图片比区域小，会进行平铺；如果图片比区域大，有多少绘制多少
 
    
}
#pragma mark - 绘制文字
-(void)drawString
{
    NSString * str = @"韩寒，这个世界的冒犯者，还是和世界和解了。";
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:12.0],NSForegroundColorAttributeName:[UIColor grayColor],NSStrokeWidthAttributeName:@10};
    // 绘制方式1
    //    [str drawInRect:CGRectMake(0, 0, 120, 100) withAttributes:dic];
    // 绘制方式2
    [str drawAtPoint:CGPointMake(0, 70) withAttributes:dic];
}
#pragma mark - 绘制椭圆
-(void)drawOvalUI
{
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50,50, 100, 50)];
    [path stroke];
}
#pragma mark - 绘制圆弧
-(void)drawArcUI
{
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:30 startAngle:M_PI_2 endAngle:0 clockwise:YES];
    [path addLineToPoint:CGPointMake(40, 40)];
    [[UIColor cyanColor] set];
    [path fill];
    
}
#pragma mark - 绘制圆角矩形
-(void)drawCornerRect
{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 150, 100) cornerRadius:20];
    [path stroke];
}
#pragma mark - 绘制两条直线相交
-(void)drawTwoLine
{  // 创建路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    // 创建起点
    [path moveToPoint:CGPointMake(10, 10)];
    // 添加线段到终点
    [path addLineToPoint:CGPointMake(90, 90)];
    
    [path moveToPoint:CGPointMake(90, 10)];
    [path addLineToPoint:CGPointMake(10, 90)];
    path.lineWidth = 10.f;// 设置线宽
    path.lineCapStyle = kCGLineCapSquare;// 设置线头样式
    path.lineJoinStyle = kCGLineJoinBevel;// 设置交叉样式
    [path stroke];// 渲染
    
}

@end
