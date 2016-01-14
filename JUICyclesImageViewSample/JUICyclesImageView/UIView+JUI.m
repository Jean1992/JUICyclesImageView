//
//  UIView+JUI.m
//  JUISample
//
//  Created by 四威 on 15/12/2.
//  Copyright © 2015年 JeanKit. All rights reserved.
//

#import "UIView+JUI.h"

@implementation UIView (JUI)

- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
}
- (CGFloat)width {
    return self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}
- (CGSize)size {
    return self.frame.size;
}
- (CGPoint)origin {
    return self.frame.origin;
}
- (void)setX:(CGFloat)x {
    CGRect frm = self.frame;
    frm.origin.x = x;
    self.frame = frm;
}
- (void)setY:(CGFloat)y {
    CGRect frm = self.frame;
    frm.origin.y = y;
    self.frame = frm;
}
- (void)setWidth:(CGFloat)width {
    CGRect frm = self.frame;
    frm.size.width = width;
    self.frame = frm;
}
- (void)setHeight:(CGFloat)height {
    CGRect frm = self.frame;
    frm.size.height = height;
    self.frame = frm;
}
- (void)setSize:(CGSize)size {
    CGRect frm = self.frame;
    frm.size = size;
    self.frame = frm;
}
- (void)setOrigin:(CGPoint)origin {
    CGRect frm = self.frame;
    frm.origin = origin;
    self.frame = frm;
}
- (void)JUIBoardWidth:(CGFloat)width boardColor:(UIColor *)color {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}
@end
