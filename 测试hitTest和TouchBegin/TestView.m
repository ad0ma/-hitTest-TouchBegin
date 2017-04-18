//
//  TestView.m
//  测试hitTest和TouchBegin
//
//  Created by Adoma's MacbookPro on 2017/4/18.
//  Copyright © 2017年 adoma. All rights reserved.
//

#import "TestView.h"

@implementation TestView



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     NSLog(@"%ld ->%s",self.tag,__func__);
}

- (UIView *)__adHitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!CGRectContainsPoint(self.bounds, point)) {
        return nil;
    }
    
    if (self.userInteractionEnabled == NO) {
        return nil;
    }
    
    if (self.alpha < 0.01) {
        return nil;
    }
    
    if (self.hidden == YES) {
        return nil;
    }
    
    if (self.subviews.count) {
        
        for (int i = 0; i < self.subviews.count; i++) {
            
            UIView *sub = self.subviews[i];
            
            CGPoint p = [self convertPoint:point toView:sub];
            
            UIView *t = [sub hitTest:p withEvent:event];
            
            if (t != nil) {
                return t;
            }
        }
    }
    
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"hit start -- >%ld",self.tag);
    UIView *v = [self __adHitTest:point withEvent:event];
    NSLog(@"hit end %ld ->%@",self.tag,v);
    
    return v;
}

@end
