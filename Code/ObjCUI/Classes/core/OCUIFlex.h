//
//  OCUIFlex.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIContainer.h"

NS_ASSUME_NONNULL_BEGIN

@class OCUIFlex;
extern OCUIFlex* Flex(ObjCUIBuild b);    // flex布局
@interface OCUIFlex : OCUIContainer

// 为了获得编译提示复写OCUI的属性
OCUIInheritProperty(OCUIFlex)

/// --- layout base yogakit

/** 容器属性：主轴方向  flex-direction */
OCUIDeclAssign(OCUIFlex, OCUIFlexDirection, flexDirection)

/** 容器属性：定义主轴方向如何换行 flex-wrap */
OCUIDeclAssign(OCUIFlex, OCUIWrap, flexWrap)

/** 容器属性：定义主轴方向如何对齐，并如何处理剩余空间 justify-content */
OCUIDeclAssign(OCUIFlex, OCUIJustify, justifyContent)

/** 容器属性：定义交叉轴轴方向，元素间以什么为参照对齐 align-items */
OCUIDeclAssign(OCUIFlex, OCUIAlign, alignItems)

/** 容器属性：定义交叉轴轴方向，元素整体相对容器如何对齐，并如何处理剩余空间 align-items*/
OCUIDeclAssign(OCUIFlex, OCUIAlign, alignContent)

@end

@interface OCUIFlexView : UIView

@end

NS_ASSUME_NONNULL_END
