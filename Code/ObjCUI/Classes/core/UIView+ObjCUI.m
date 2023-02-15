//
//  UIView+ObjCUI.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

// 这里的实现再思考下🤔

#import "UIView+ObjCUI.h"
#import "OCUIContext.h"
#import <objc/runtime.h>

@implementation UIView (ObjCUI)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [self exchangeOriSEL:@selector(layoutSubviews) cusSEL:@selector(ocui_layoutSubviews)];
//        [self exchangeOriSEL:@selector(sizeThatFits:) cusSEL:@selector(ocui_sizeThatFits:)];
    });
}

+ (void)exchangeOriSEL:(SEL)oriSEL cusSEL:(SEL)cusSEL  {
    Class selfClass = [self class];
    Method oriMethod = class_getInstanceMethod(selfClass, oriSEL);
    Method cusMethod = class_getInstanceMethod(selfClass, cusSEL);
    BOOL addSucc = class_addMethod(selfClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
    if (addSucc) {
        class_replaceMethod(selfClass, cusSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, cusMethod);
    }
}

- (void)setOcui_node:(UIView *)body {
    objc_setAssociatedObject(self, @selector(setOcui_node:), body, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (OCUINode *)ocui_node {
    return objc_getAssociatedObject(self, @selector(setOcui_node:));
}


- (void)setOcui_building:(BOOL)ocui_building {
    objc_setAssociatedObject(self, @selector(setOcui_building:), @(ocui_building), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)ocui_building {
    return [objc_getAssociatedObject(self, @selector(setOcui_building:)) boolValue];
}

- (void)tryBuildNodeView {
    if ([self respondsToSelector:@selector(body)]) {
        self.ocui_building = YES;
        if (!self.ocui_node) {
            [OCUIContext executeBuildBody:^{
                self.ocui_node = [self body];
            }];
            // 0. 构造视图
            [self.ocui_node makeUIView];
            // 1. 设置视图
            [self.ocui_node updateUIView];
        }
        if (self.ocui_node) {
            if (!self.ocui_node.ocui_view.superview) {
                [self addSubview:self.ocui_node.ocui_view];
            }
        }
        self.ocui_building = NO;
    }
}

- (void)ocui_layoutSubviews {
    [self ocui_layoutSubviews];
    if (self.ocui_building) {
        return;
    }
    [self tryBuildNodeView];
    if (self.ocui_node) {
        // 3. 测量
        CGSize s = [self sizeThatFits:self.bounds.size];
        // 4. 布局
        self.ocui_node.ocui_view.frame = CGRectMake(0, 0, s.width, s.height);
        self.ocui_node.ocui_view.center = CGPointMake(s.width*0.5, s.height*0.5);
        if (!self.ocui_node.ocui_view.superview) {
            [self insertSubview:self.ocui_node.ocui_view atIndex:0];
        }
    }
}

- (CGSize)ocui_sizeThatFits:(CGSize)size {
    [self tryBuildNodeView];
    if (self.ocui_node && !self.ocui_building) {
        return [self.ocui_node sizeThatFits:size];
    } else {
        return [self ocui_sizeThatFits:size];
    }
}

@end
