//
//  UIViewController+ObjCUI.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "UIViewController+ObjCUI.h"
#import "UIView+ObjCUI.h"
#import "OCUIContext.h"
#import <objc/runtime.h>
#import "UIView+Yoga.h"

@implementation UIViewController (ObjCUI)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeOriSEL:@selector(viewDidLoad) cusSEL:@selector(ocui_viewDidLoad)];
        [self exchangeOriSEL:@selector(viewWillLayoutSubviews) cusSEL:@selector(ocui_viewWillLayoutSubviews)];
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

- (void)reloadNodeTree {
    if ([self respondsToSelector:@selector(body)]) {
        UIView *oldView = self.view.ocui_node.ocui_view;
        [OCUIContext executeBuildBody:^{
            self.view.ocui_node = [self body];
            self.view.ocui_node.mainResponder = self;
        }];
        // 0. 构造视图
        self.view.ocui_node.ocui_view = [self.view.ocui_node makeUIView];
        // 1. 设置视图
        [self.view.ocui_node updateUIView];
        if (!self.view.ocui_node.ocui_view.superview) {
            [oldView removeFromSuperview];
            [self.view addSubview:self.view.ocui_node.ocui_view];
        }
    }
}

- (void)ocui_viewDidLoad {
    [self ocui_viewDidLoad];
    [self reloadNodeTree];
}

- (void)ocui_viewWillLayoutSubviews {
    [self ocui_viewWillLayoutSubviews];
    [self.view.ocui_node.ocui_view.yoga applyLayoutPreservingOrigin:YES];
    self.view.ocui_node.ocui_view.center = self.view.center;
}


@end
