//
//  OCUIViewNode.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIView.h"
#import "OCUIContext.h"
#import "UIView+Yoga.h"

@implementation OCUIBackgroundView

@end

@interface OCUIView()

@property (nonatomic, strong) NSMutableArray<OCUIAction *> *actions;

@end

OCUIView* View(UIView *v) {
    OCUIView *node = [OCUIView new];
    node.view(v);
    [OCUIContext appendNode:node];
    return node;
}
@implementation OCUIView

- (instancetype)init {
    if (self = [super init]) {
        self.actions = [NSMutableArray array];
    }
    return self;
}

OCUIImpl(OCUIView, BOOL, hidden)

OCUIImpl(OCUIView, BOOL, visible)

OCUIImpl(OCUIView, UIViewContentMode, contentMode)

OCUIImpl(OCUIView, CGFloat, alpha)

OCUIImpl(OCUIView, UIColor *, backgroundColor)

OCUIImpl(OCUIView, CGFloat, cornerRadius)

OCUIImpl(OCUIView, CGFloat, borderWidth)

OCUIImpl(OCUIView, UIColor *, borderColor)

OCUIImpl(OCUIView, UIColor *, shadowColor)

OCUIImpl(OCUIView, CGSize, shadowOffset)

OCUIImpl(OCUIView, CGFloat, shadowRadius)

OCUIImpl(OCUIView, BOOL, clipsToBounds)

OCUIImpl(OCUIView, CGSize, size)

OCUIImpl(OCUIView, ObjCUISetup, setupUI)

OCUIImpl(OCUIView, UIControl *, backgroundView)

OCUIImpl(OCUIView, UIView *, view)

OCUIImpl(OCUIView, UIView *, maskView)

OCUIImpl(OCUIView, OCUIAction *, addAction)

/// --- layout base yogakit

OCUIImpl(OCUIView, OCUIDirection, direction)

OCUIImpl(OCUIView, OCUIAlign, alignSelf)

OCUIImpl(OCUIView, OCUIPositionType, position)


OCUIImpl(OCUIView, OCUIOverflow, overflow)

OCUIImpl(OCUIView, OCUIDisplay, display)

OCUIImpl(OCUIView, CGFloat, flex)

OCUIImpl(OCUIView, CGFloat, flexGrow)

OCUIImpl(OCUIView, CGFloat, flexShrink)

OCUIImpl(OCUIView, CGFloat, flexBasis)

OCUIImpl(OCUIView, CGFloat, left)

OCUIImpl(OCUIView, CGFloat, top)

OCUIImpl(OCUIView, CGFloat, right)

OCUIImpl(OCUIView, CGFloat, bottom)

OCUIImpl(OCUIView, CGFloat, start)

OCUIImpl(OCUIView, CGFloat, end)

OCUIImpl(OCUIView, CGFloat, marginLeft)

OCUIImpl(OCUIView, CGFloat, marginTop)

OCUIImpl(OCUIView, CGFloat, marginRight)

OCUIImpl(OCUIView, CGFloat, marginBottom)

OCUIImpl(OCUIView, CGFloat, marginStart)

OCUIImpl(OCUIView, CGFloat, marginEnd)

OCUIImpl(OCUIView, CGFloat, marginHorizontal)

OCUIImpl(OCUIView, CGFloat, marginVertical)

OCUIImpl(OCUIView, CGFloat, margin)

OCUIImpl(OCUIView, CGFloat, paddingLeft)

OCUIImpl(OCUIView, CGFloat, paddingTop)

OCUIImpl(OCUIView, CGFloat, paddingRight)

OCUIImpl(OCUIView, CGFloat, paddingBottom)

OCUIImpl(OCUIView, CGFloat, paddingStart)

OCUIImpl(OCUIView, CGFloat, paddingEnd)

OCUIImpl(OCUIView, CGFloat, paddingHorizontal)

OCUIImpl(OCUIView, CGFloat, paddingVertical)

OCUIImpl(OCUIView, CGFloat, padding)

OCUIImpl(OCUIView, CGFloat, borderLeftWidth)

OCUIImpl(OCUIView, CGFloat, borderTopWidth)

OCUIImpl(OCUIView, CGFloat, borderRightWidth)

OCUIImpl(OCUIView, CGFloat, borderBottomWidth)

OCUIImpl(OCUIView, CGFloat, borderStartWidth)

OCUIImpl(OCUIView, CGFloat, borderEndWidth)

OCUIImpl(OCUIView, CGFloat, borderLayoutWidth)

OCUIImpl(OCUIView, CGFloat, width)

OCUIImpl(OCUIView, CGFloat, height)

OCUIImpl(OCUIView, CGFloat, minWidth)

OCUIImpl(OCUIView, CGFloat, minHeight)

OCUIImpl(OCUIView, CGFloat, maxWidth)

OCUIImpl(OCUIView, CGFloat, maxHeight)

OCUIImpl(OCUIView, CGFloat, aspectRatio)


- (UIView *)makeUIView {
    return self.ocui_view;
}

- (void)updateUIView {
    if (self.ocui_hiddenSetted) self.ocui_view.hidden = self.ocui_hidden;
    if (self.ocui_contentModeSetted) self.ocui_view.contentMode = self.ocui_contentMode;
    if (self.ocui_backgroundColorSetted) self.ocui_view.backgroundColor = self.ocui_backgroundColor;
    if (self.ocui_backgroundColorSetted) self.ocui_view.backgroundColor = self.ocui_backgroundColor;
    if (self.ocui_cornerRadiusSetted) self.ocui_backgroundView.layer.cornerRadius = self.ocui_cornerRadius;
    if (self.ocui_borderWidthSetted) self.ocui_backgroundView.layer.borderWidth = self.ocui_borderWidth;
    if (self.ocui_borderColorSetted) self.ocui_backgroundView.layer.borderColor = self.ocui_borderColor.CGColor;
    if (self.ocui_shadowColorSetted) self.ocui_backgroundView.layer.shadowColor = self.ocui_shadowColor.CGColor;
    if (self.ocui_shadowOffsetSetted) self.ocui_backgroundView.layer.shadowOffset = self.ocui_shadowOffset;
    // 布局信息
    UIView *layoutView = self.ocui_backgroundView ? self.ocui_backgroundView : self.ocui_view;
    [layoutView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        if (self.ocui_directionSetted) layout.direction = (YGDirection)self.ocui_direction;
//        if (self.ocui_flexDirectionSetted) layout.flexDirection = (YGFlexDirection)self.ocui_flexDirection;
//        if (self.ocui_justifyContentSetted) layout.justifyContent = (YGJustify)self.ocui_justifyContent;
//        if (self.ocui_alignContentSetted) layout.alignContent = (YGAlign)self.ocui_alignContent;
//        if (self.ocui_alignItemsSetted) layout.alignItems = (YGAlign)self.ocui_alignItems;
        if (self.ocui_alignSelfSetted) layout.alignSelf = (YGAlign)self.ocui_alignSelf;
        if (self.ocui_positionSetted) layout.position = (YGPositionType)self.ocui_position;
//        if (self.ocui_flexWrapSetted) layout.flexWrap = (YGWrap)self.ocui_flexWrap;
        if (self.ocui_overflowSetted) layout.overflow = (YGOverflow)self.ocui_overflow;
        if (self.ocui_displaySetted) layout.display = (YGDisplay)self.ocui_display;
        if (self.ocui_flexSetted) layout.flex = self.ocui_flex;
        if (self.ocui_flexGrowSetted) layout.flexGrow = self.ocui_flexGrow;
        if (self.ocui_flexShrinkSetted) layout.flexShrink = self.ocui_flexShrink;
        if (self.ocui_flexBasisSetted) layout.flexBasis = YGPointValue(self.ocui_flexBasis);
        if (self.ocui_leftSetted) layout.left = YGPointValue(self.ocui_left);
        if (self.ocui_topSetted) layout.top = YGPointValue(self.ocui_top);
        if (self.ocui_rightSetted) layout.right = YGPointValue(self.ocui_right);
        if (self.ocui_bottomSetted) layout.bottom = YGPointValue(self.ocui_bottom);
        if (self.ocui_startSetted) layout.start = YGPointValue(self.ocui_start);
        if (self.ocui_endSetted) layout.end = YGPointValue(self.ocui_end);
        if (self.ocui_marginLeftSetted) layout.marginLeft = YGPointValue(self.ocui_marginLeft);
        if (self.ocui_marginTopSetted) layout.marginTop = YGPointValue(self.ocui_marginTop);
        if (self.ocui_marginRightSetted) layout.marginRight = YGPointValue(self.ocui_marginRight);
        if (self.ocui_marginBottomSetted) layout.marginBottom = YGPointValue(self.ocui_marginBottom);
        if (self.ocui_marginStartSetted) layout.marginStart = YGPointValue(self.ocui_marginStart);
        if (self.ocui_marginEndSetted) layout.marginEnd = YGPointValue(self.ocui_marginEnd);
        if (self.ocui_marginHorizontalSetted) layout.marginHorizontal = YGPointValue(self.ocui_marginHorizontal);
        if (self.ocui_marginVerticalSetted) layout.marginVertical = YGPointValue(self.ocui_marginVertical);
        if (self.ocui_marginSetted) layout.margin = YGPointValue(self.ocui_margin);
        if (self.ocui_paddingLeftSetted) layout.paddingLeft = YGPointValue(self.ocui_paddingLeft);
        if (self.ocui_paddingTopSetted) layout.paddingTop = YGPointValue(self.ocui_paddingTop);
        if (self.ocui_paddingRightSetted) layout.paddingRight = YGPointValue(self.ocui_paddingRight);
        if (self.ocui_paddingBottomSetted) layout.paddingBottom = YGPointValue(self.ocui_paddingBottom);
        if (self.ocui_paddingStartSetted) layout.paddingStart = YGPointValue(self.ocui_paddingStart);
        if (self.ocui_paddingEndSetted) layout.paddingEnd = YGPointValue(self.ocui_paddingEnd);
        if (self.ocui_paddingHorizontalSetted) layout.paddingHorizontal = YGPointValue(self.ocui_paddingHorizontal);
        if (self.ocui_paddingVerticalSetted) layout.paddingVertical = YGPointValue(self.ocui_paddingVertical);
        if (self.ocui_paddingSetted) layout.padding = YGPointValue(self.ocui_padding);
        if (self.ocui_borderLeftWidthSetted) layout.borderLeftWidth = self.ocui_borderLeftWidth;
        if (self.ocui_borderTopWidthSetted) layout.borderTopWidth = self.ocui_borderTopWidth;
        if (self.ocui_borderRightWidthSetted) layout.borderRightWidth = self.ocui_borderRightWidth;
        if (self.ocui_borderBottomWidthSetted) layout.borderBottomWidth = self.ocui_borderBottomWidth;
        if (self.ocui_borderStartWidthSetted) layout.borderStartWidth = self.ocui_borderStartWidth;
        if (self.ocui_borderEndWidthSetted) layout.borderEndWidth = self.ocui_borderEndWidth;
        if (self.ocui_borderWidthSetted) layout.borderWidth = self.ocui_borderLayoutWidth;
        if (self.ocui_widthSetted) layout.width = YGPointValue(self.ocui_width);
        if (self.ocui_heightSetted) layout.height = YGPointValue(self.ocui_height);
        if (self.ocui_minWidthSetted) layout.minWidth = YGPointValue(self.ocui_minWidth);
        if (self.ocui_minHeightSetted) layout.minHeight = YGPointValue(self.ocui_minHeight);
        if (self.ocui_maxWidthSetted) layout.maxWidth = YGPointValue(self.ocui_maxWidth);
        if (self.ocui_maxHeightSetted) layout.maxHeight = YGPointValue(self.ocui_maxHeight);
        if (self.ocui_aspectRatioSetted) layout.aspectRatio = self.ocui_aspectRatio;
    }];
    
    // 处理响应事件
    [self.actions enumerateObjectsUsingBlock:^(OCUIAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.ocui_backgroundView addTarget:obj.target action:obj.sel forControlEvents:obj.events];
    }];
    
    // 处理动画任务
    // to do ...
    
    // 处理自定义
    if (self.ocui_setupUI) {
        self.ocui_setupUI(self.ocui_view);
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self.ocui_view sizeThatFits:size];
}

@end
