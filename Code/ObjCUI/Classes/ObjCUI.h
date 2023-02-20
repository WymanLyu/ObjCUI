//
//  ObjCUI.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIPropertyWrappers.h"
#import "UIViewController+ObjCUI.h"
#import "UIView+ObjCUI.h"
#import "OCUIGeometry.h"
#import "OCUIContainer.h"
#import "OCUIFlex.h"
#import "OCUIHStack.h"
#import "OCUIVStack.h"
#import "OCUIZStack.h"
#import "OCUIImage.h"
#import "OCUIText.h"
#import "OCUIScroll.h"

NS_ASSUME_NONNULL_BEGIN


@interface UIView (ObjCUI)

- (OCUINode *)body;

@end

@interface UIViewController (ObjCUI)

- (OCUINode *)body;

@end


@class Geometry;

typedef void(^ObjCUIGeometryBuild)(Geometry *geo);

// 容器
extern OCUIHStack* HStack(ObjCUIBuild b);    // 水平布局
extern OCUIVStack* VStack(ObjCUIBuild b);    // 垂直布局
extern OCUIZStack* ZStack(ObjCUIBuild b);    // z轴布局
extern OCUIScroll* Scroll(ObjCUIBuild b);    // 滚动
//extern OCUIContainer* List(ObjCUIBuild b);      // 列表布局
extern OCUIFlex* Flex(ObjCUIBuild b);      // flex布局
//extern OCUIContainerNode* LazyScroll(ObjcUIBuild b);// 滚动, reuseConfig

// 元素
extern OCUIView* View(UIView *v);
extern OCUIImage* Image(NSString *src);
extern OCUIText* Text(NSString *text);
//extern OCUIView* Padding(CGFloat padding);
//extern OCUIView* Divider(CGFloat padding);
//extern OCUIView* Spacer(CGFloat padding);
//extern OCUIView* Input(NSString *text);
//extern OCUIView* Row(ObjCUIBuild b);
//extern OCUIView* Cell(ObjCUIBuild cls);

// 父布局
//extern OCUINode* GeometryReader(ObjCUIGeometryBuild b);    // 父布局






NS_ASSUME_NONNULL_END
