//
//  OCUIViewNode.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUINode.h"
#import "OCUIAction.h"

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, OCUIAlign) {
    OCUIAlignAuto,
    OCUIAlignFlexStart,
    OCUIAlignCenter,
    OCUIAlignFlexEnd,
    OCUIAlignStretch,
    OCUIAlignBaseline,
    OCUIAlignSpaceBetween,
    OCUIAlignSpaceAround,
};

typedef NS_ENUM(NSUInteger, OCUIDimension) {
    OCUIDimensionWidth,
    OCUIDimensionHeight,
};

typedef NS_ENUM(NSUInteger, OCUIDirection) {
    OCUIDirectionInherit,
    OCUIDirectionLTR,
    OCUIDirectionRTL,
};

typedef NS_ENUM(NSUInteger, OCUIDisplay) {
    OCUIDisplayFlex,
    OCUIDisplayNone,
};

typedef NS_ENUM(NSUInteger, OCUIEdge) {
    OCUIEdgeLeft,
    OCUIEdgeTop,
    OCUIEdgeRight,
    OCUIEdgeBottom,
    OCUIEdgeStart,
    OCUIEdgeEnd,
    OCUIEdgeHorizontal,
    OCUIEdgeVertical,
    OCUIEdgeAll,
};

typedef NS_ENUM(NSUInteger, OCUIExperimentalFeature) {
    OCUIExperimentalFeatureWebFlexBasis,
};

typedef NS_ENUM(NSUInteger, OCUIFlexDirection) {
    OCUIFlexDirectionColumn,
    OCUIFlexDirectionColumnReverse,
    OCUIFlexDirectionRow,
    OCUIFlexDirectionRowReverse,
};

typedef NS_ENUM(NSUInteger, OCUIJustify) {
    OCUIJustifyFlexStart,
    OCUIJustifyCenter,
    OCUIJustifyFlexEnd,
    OCUIJustifySpaceBetween,
    OCUIJustifySpaceAround,
    OCUIJustifySpaceEvenly,
};

typedef NS_ENUM(NSUInteger, OCUIMeasureMode) {
    OCUIMeasureModeUndefined,
    OCUIMeasureModeExactly,
    OCUIMeasureModeAtMost,
};

typedef NS_ENUM(NSUInteger, OCUIOverflow) {
    OCUIOverflowVisible,
    OCUIOverflowHidden,
    OCUIOverflowScroll,
};

typedef NS_ENUM(NSUInteger, OCUIPositionType) {
    OCUIPositionTypeRelative,
    OCUIPositionTypeAbsolute,
};

typedef NS_ENUM(NSUInteger, OCUIPrintOptions) {
    OCUIPrintOptionsLayout,
    OCUIPrintOptionsStyle,
    OCUIPrintOptionsChildren,
};

typedef NS_ENUM(NSUInteger, OCUIUnit) {
    OCUIUnitUndefined,
    OCUIUnitPoint,
    OCUIUnitPercent,
    OCUIUnitAuto,
};

typedef NS_ENUM(NSUInteger, OCUIWrap) {
    OCUIWrapNoWrap,
    OCUIWrapWrap,
    OCUIWrapWrapReverse,
};



typedef void(^ObjCUISetup)(__kindof UIView *);
@class OCUIBackgroundView;
@class OCUIView;
extern OCUIView* View(UIView *v);

@interface OCUIView : OCUINode

OCUIDeclAssign(OCUIView, BOOL, hidden)

OCUIDeclAssign(OCUIView, BOOL, visible)

OCUIDeclAssign(OCUIView, UIViewContentMode, contentMode)

OCUIDeclAssign(OCUIView, CGFloat, alpha)

OCUIDeclStrong(OCUIView, UIColor *, backgroundColor)

OCUIDeclAssign(OCUIView, CGFloat, cornerRadius)

OCUIDeclAssign(OCUIView, CGFloat, borderWidth)

OCUIDeclStrong(OCUIView, UIColor *, borderColor)

OCUIDeclStrong(OCUIView, UIColor *, shadowColor)

OCUIDeclAssign(OCUIView, CGSize, shadowOffset)

OCUIDeclAssign(OCUIView, CGFloat, shadowRadius)

OCUIDeclAssign(OCUIView, BOOL, clipsToBounds)

OCUIDeclAssign(OCUIView, CGSize, size)

OCUIDeclCopy(OCUIView, ObjCUISetup, setupUI)

OCUIDeclStrong(OCUIView, UIControl *, backgroundView)

OCUIDeclStrong(OCUIView, UIView *, view)

OCUIDeclStrong(OCUIView, UIView *, maskView)

OCUIDeclCopy(OCUIView, OCUIAction *, addAction)

/// --- layout base yogakit

OCUIDeclAssign(OCUIView, OCUIDirection, direction)

/** 项目属性：主轴方向  处理拉伸对于剩余空间的分配比例  flex-grow */
OCUIDeclAssign(OCUIView, CGFloat, flexGrow)

/** 项目属性：主轴方向 处理挤压对于溢出空间的挤压比例  flex-shrink */
OCUIDeclAssign(OCUIView, CGFloat, flexShrink)

/** 项目属性：项目初始尺寸 flex-basis */
OCUIDeclAssign(OCUIView, CGFloat, flexBasis)

/** 项目属性：义交叉轴轴方向，元素以什么为参照对齐，可以覆盖align-items align-self */
OCUIDeclAssign(OCUIView, OCUIAlign, alignSelf)

OCUIDeclAssign(OCUIView, CGFloat, width)

OCUIDeclAssign(OCUIView, CGFloat, height)

OCUIDeclAssign(OCUIView, CGFloat, minWidth)

OCUIDeclAssign(OCUIView, CGFloat, minHeight)

OCUIDeclAssign(OCUIView, CGFloat, maxWidth)

OCUIDeclAssign(OCUIView, CGFloat, maxHeight)

OCUIDeclAssign(OCUIView, CGFloat, marginLeft)

OCUIDeclAssign(OCUIView, CGFloat, marginTop)

OCUIDeclAssign(OCUIView, CGFloat, marginRight)

OCUIDeclAssign(OCUIView, CGFloat, marginBottom)

OCUIDeclAssign(OCUIView, CGFloat, marginStart)

OCUIDeclAssign(OCUIView, CGFloat, marginEnd)

OCUIDeclAssign(OCUIView, CGFloat, marginHorizontal)

OCUIDeclAssign(OCUIView, CGFloat, marginVertical)

OCUIDeclAssign(OCUIView, CGFloat, margin)

OCUIDeclAssign(OCUIView, CGFloat, paddingLeft)

OCUIDeclAssign(OCUIView, CGFloat, paddingTop)

OCUIDeclAssign(OCUIView, CGFloat, paddingRight)

OCUIDeclAssign(OCUIView, CGFloat, paddingBottom)

OCUIDeclAssign(OCUIView, CGFloat, paddingStart)

OCUIDeclAssign(OCUIView, CGFloat, paddingEnd)

OCUIDeclAssign(OCUIView, CGFloat, paddingHorizontal)

OCUIDeclAssign(OCUIView, CGFloat, paddingVertical)

OCUIDeclAssign(OCUIView, CGFloat, padding)

OCUIDeclAssign(OCUIView, CGFloat, borderLeftWidth)

OCUIDeclAssign(OCUIView, CGFloat, borderTopWidth)

OCUIDeclAssign(OCUIView, CGFloat, borderRightWidth)

OCUIDeclAssign(OCUIView, CGFloat, borderBottomWidth)

OCUIDeclAssign(OCUIView, CGFloat, borderStartWidth)

OCUIDeclAssign(OCUIView, CGFloat, borderEndWidth)

OCUIDeclAssign(OCUIView, CGFloat, borderLayoutWidth)

OCUIDeclAssign(OCUIView, OCUIPositionType, position)

OCUIDeclAssign(OCUIView, OCUIOverflow, overflow)

OCUIDeclAssign(OCUIView, OCUIDisplay, display)

OCUIDeclAssign(OCUIView, CGFloat, flex)

OCUIDeclAssign(OCUIView, CGFloat, left)

OCUIDeclAssign(OCUIView, CGFloat, top)

OCUIDeclAssign(OCUIView, CGFloat, right)

OCUIDeclAssign(OCUIView, CGFloat, bottom)

OCUIDeclAssign(OCUIView, CGFloat, start)

OCUIDeclAssign(OCUIView, CGFloat, end)


OCUIDeclAssign(OCUIView, CGFloat, aspectRatio)


@end

@interface OCUIBackgroundView : UIControl

@end

NS_ASSUME_NONNULL_END
