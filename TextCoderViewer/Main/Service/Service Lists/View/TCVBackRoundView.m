//
//  TCVBackRoundView.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/19.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVBackRoundView.h"

@interface TCVBackRoundView ()

@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

@end

@implementation TCVBackRoundView

- (CGFloat)radius {
    if(!_radius) {
        _radius = 0;
    }
    return _radius;
}

- (CGFloat)top {
    if(!_top) {
        _top = 0;
    }
    return _top;
}

- (CGFloat)left {
    if(!_left) {
        _left = 0;
    }
    return _left;
}

- (CGFloat)bottom {
    if(!_bottom) {
        _bottom = 0;
    }
    return _bottom;
}

- (CGFloat)right {
    if(!_right) {
        _right = 0;
    }
    return _right;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame radius:0 top:0 left:0 bottom:0 right:0];
}

- (instancetype)initWithFrame:(CGRect)frame radius:(CGFloat)radius top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    if(self = [super initWithFrame:frame]) {
        self.radius = radius;
        self.top = top;
        self.left = left;
        self.bottom = bottom;
        self.right = right;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.left, self.top)];
    [path addLineToPoint:CGPointMake(0, self.radius)];
    [path addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:M_PI endAngle:M_PI * 1.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(rect.size.width - self.radius, 0)];
    [path addArcWithCenter:CGPointMake(rect.size.width - self.radius, self.radius) radius:self.radius startAngle:- M_PI_2 endAngle:0 clockwise:YES];
    //[path addLineToPoint:CGPointMake(rect.size.width, self.naviHeight)];
    //[path addLineToPoint:CGPointMake(0, self.naviHeight)];
    
    path.lineWidth = 1.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    [path stroke];
    
}

@end
