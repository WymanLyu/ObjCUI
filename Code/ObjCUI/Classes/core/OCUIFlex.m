//
//  OCUIFlex.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIFlex.h"
#import "OCUIContext.h"
#import "UIView+Yoga.h"

OCUIFlex* Flex(ObjCUIBuild b) {
    OCUIFlex *node = [OCUIFlex new];
    [OCUIContext appendNode:node builder:^{
        if (b) {
            b();
        }
    }];
    return node;
}
@implementation OCUIFlex


OCUIImpl(OCUIFlex, OCUIFlexDirection, flexDirection)

OCUIImpl(OCUIFlex, OCUIWrap, flexWrap)

OCUIImpl(OCUIFlex, OCUIJustify, justifyContent)

OCUIImpl(OCUIFlex, OCUIAlign, alignItems)

OCUIImpl(OCUIFlex, OCUIAlign, alignContent)

- (UIView *)makeUIView {
    OCUIFlexView *flexView = [OCUIFlexView new];
    [self.childs enumerateObjectsUsingBlock:^(OCUINode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:OCUIView.class]) {
            OCUIView *viewNode = (OCUIView *)obj;
            viewNode.ocui_view = [viewNode makeUIView];
            [flexView addSubview:viewNode.ocui_view];
        }
    }];
    return flexView;
}

- (void)updateUIView {
    [super updateUIView];
    // 布局信息
    UIView *layoutView = self.ocui_backgroundView ? self.ocui_backgroundView : self.ocui_view;
    [layoutView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        if (self.ocui_flexDirectionSetted) layout.flexDirection = (YGFlexDirection)self.ocui_flexDirection;
        if (self.ocui_flexWrapSetted) layout.flexWrap = (YGWrap)self.ocui_flexWrap;
        if (self.ocui_justifyContentSetted) layout.justifyContent = (YGJustify)self.ocui_justifyContent;
        if (self.ocui_alignItemsSetted) layout.alignItems = (YGAlign)self.ocui_alignItems;
        if (self.ocui_alignContentSetted) layout.alignContent = (YGAlign)self.ocui_alignContent;
    }];
    [self.childs enumerateObjectsUsingBlock:^(OCUINode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:OCUIView.class]) {
            OCUIView *viewNode = (OCUIView *)obj;
            [viewNode updateUIView];
        }
    }];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self.ocui_view.yoga calculateLayoutWithSize:size];
}

@end

@implementation OCUIFlexView : UIView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    ;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [self.yoga applyLayoutPreservingOrigin:YES];
//}

@end
