//
//  OCUINode.h
//  ObjcUI
//
//  Created by wyman on 2020/12/31.
//  Copyright © 2020 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCUIDep.h"

NS_ASSUME_NONNULL_BEGIN


#pragma mark - macro

#define OCUIDeclAssignDot(node, type, name) \
@property (nonatomic, readonly) node *(^name)(type name); \
@property (nonatomic, readonly) node *(^name##$)(OCUIDep *name); \

#define OCUIDeclStrongDot(node, type, name) \
@property (nonatomic, readonly) node *(^name)(type name); \
@property (nonatomic, readonly) node *(^name##$)(OCUIDep *name); \

#define OCUIDeclCopyDot(node, type, name) \
@property (nonatomic, readonly) node *(^name)(type name); \
@property (nonatomic, readonly) node *(^name##$)(OCUIDep *name); \

#define OCUIDeclAssign(node, type, name) \
OCUIDeclAssignDot(node, type, name) \
@property (nonatomic, assign) type ocui_##name; \
@property (nonatomic, strong) OCUIDep *ocui_##name##Binding; \
@property (nonatomic, assign) BOOL ocui_##name##Setted;

#define OCUIDeclStrong(node, type, name) \
OCUIDeclStrongDot(node, type, name) \
@property (nonatomic, strong) type ocui_##name; \
@property (nonatomic, strong) OCUIDep *ocui_##name##Binding; \
@property (nonatomic, assign) BOOL ocui_##name##Setted;

#define OCUIDeclCopy(node, type, name) \
OCUIDeclCopyDot(node, type, name) \
@property (nonatomic, copy) type ocui_##name; \
@property (nonatomic, strong) OCUIDep *ocui_##name##Binding; \
@property (nonatomic, assign) BOOL ocui_##name##Setted;


#define OCUIImpl(node, type, name) \
- (node * _Nonnull (^)(type))name { \
    return ^node *(type name) { \
        self.ocui_##name = name; \
        self.ocui_##name##Setted = YES; \
        return self; \
    }; \
} \
- (node * _Nonnull (^)(OCUIDep *))name##$ { \
    return ^node *(OCUIDep *name) { \
        self.ocui_##name##Binding = name; \
        self.ocui_##name##Setted = YES; \
        return self; \
    }; \
}


#define OCUIInheritProperty(type) \
OCUIDeclAssignDot(type, BOOL, hidden) \
OCUIDeclAssignDot(type, BOOL, visible) \
OCUIDeclAssignDot(type, UIViewContentMode, contentMode) \
OCUIDeclAssignDot(type, CGFloat, alpha) \
OCUIDeclStrongDot(type, UIColor *, backgroundColor) \
OCUIDeclAssignDot(type, CGFloat, cornerRadius) \
OCUIDeclAssignDot(type, CGFloat, borderWidth) \
OCUIDeclStrongDot(type, UIColor *, borderColor) \
OCUIDeclStrongDot(type, UIColor *, shadowColor) \
OCUIDeclAssignDot(type, CGSize, shadowOffset) \
OCUIDeclAssignDot(type, CGFloat, shadowRadius) \
OCUIDeclAssignDot(type, BOOL, clipsToBounds) \
OCUIDeclAssignDot(type, CGSize, size) \
OCUIDeclCopyDot(type, ObjCUISetup, setupUI) \
OCUIDeclStrongDot(type, UIControl *, backgroundView) \
OCUIDeclStrongDot(type, UIView *, view) \
OCUIDeclStrongDot(type, UIView *, maskView) \
OCUIDeclCopyDot(type, OCUIAction *, addAction) \
OCUIDeclAssignDot(type, OCUIDirection, direction) \
OCUIDeclAssignDot(type, CGFloat, flexGrow) \
OCUIDeclAssignDot(type, CGFloat, flexShrink) \
OCUIDeclAssignDot(type, CGFloat, flexBasis) \
OCUIDeclAssignDot(type, OCUIAlign, alignSelf) \
OCUIDeclAssignDot(type, CGFloat, width) \
OCUIDeclAssignDot(type, CGFloat, height) \
OCUIDeclAssignDot(type, CGFloat, minWidth) \
OCUIDeclAssignDot(type, CGFloat, minHeight) \
OCUIDeclAssignDot(type, CGFloat, maxWidth) \
OCUIDeclAssignDot(type, CGFloat, maxHeight) \
OCUIDeclAssignDot(type, CGFloat, marginLeft) \
OCUIDeclAssignDot(type, CGFloat, marginTop) \
OCUIDeclAssignDot(type, CGFloat, marginRight) \
OCUIDeclAssignDot(type, CGFloat, marginBottom) \
OCUIDeclAssignDot(type, CGFloat, marginStart) \
OCUIDeclAssignDot(type, CGFloat, marginEnd) \
OCUIDeclAssignDot(type, CGFloat, marginHorizontal) \
OCUIDeclAssignDot(type, CGFloat, marginVertical) \
OCUIDeclAssignDot(type, CGFloat, margin) \
OCUIDeclAssignDot(type, CGFloat, paddingLeft) \
OCUIDeclAssignDot(type, CGFloat, paddingTop) \
OCUIDeclAssignDot(type, CGFloat, paddingRight) \
OCUIDeclAssignDot(type, CGFloat, paddingBottom) \
OCUIDeclAssignDot(type, CGFloat, paddingStart) \
OCUIDeclAssignDot(type, CGFloat, paddingEnd) \
OCUIDeclAssignDot(type, CGFloat, paddingHorizontal) \
OCUIDeclAssignDot(type, CGFloat, paddingVertical) \
OCUIDeclAssignDot(type, CGFloat, padding) \
OCUIDeclAssignDot(type, CGFloat, borderLeftWidth) \
OCUIDeclAssignDot(type, CGFloat, borderTopWidth) \
OCUIDeclAssignDot(type, CGFloat, borderRightWidth) \
OCUIDeclAssignDot(type, CGFloat, borderBottomWidth) \
OCUIDeclAssignDot(type, CGFloat, borderStartWidth) \
OCUIDeclAssignDot(type, CGFloat, borderEndWidth) \
OCUIDeclAssignDot(type, CGFloat, borderLayoutWidth) \
OCUIDeclAssignDot(type, OCUIPositionType, position) \
OCUIDeclAssignDot(type, OCUIOverflow, overflow) \
OCUIDeclAssignDot(type, OCUIDisplay, display) \
OCUIDeclAssignDot(type, CGFloat, flex) \
OCUIDeclAssignDot(type, CGFloat, left) \
OCUIDeclAssignDot(type, CGFloat, top) \
OCUIDeclAssignDot(type, CGFloat, right) \
OCUIDeclAssignDot(type, CGFloat, bottom) \
OCUIDeclAssignDot(type, CGFloat, start) \
OCUIDeclAssignDot(type, CGFloat, end) \
OCUIDeclAssignDot(type, CGFloat, aspectRatio) \


@protocol OCUIViewRepresentable <NSObject>

/** 创建view */
- (UIView *)makeUIView;

/** 更新view属性 */
- (void)updateUIView;

/** 测量view内容尺寸 */
- (CGSize)sizeThatFits:(CGSize)size;

@end


@interface OCUINode : NSObject <OCUIViewRepresentable>

// ---------------- 数据源

/** 依赖 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, OCUIDep *> *deps;

/** 尺寸缓存 */
@property (nonatomic, strong) NSMutableDictionary<NSValue *, NSValue*> *layoutCache;

// ---------------- 树结构

/** 主响应值*/
@property (nonatomic, weak) UIResponder *mainResponder;

/** 主容器，主容器自身指向自己*/
@property (nonatomic, weak) OCUINode *topNode;

/** 父容器，容器自身指向自己*/
@property (nonatomic, weak) OCUINode *parent;

/** 所有子元素 node */
@property (nonatomic, strong) NSMutableArray<OCUINode *> *childs;

// ---------------- 生命周期 子类实现

@property (nonatomic, assign, getter=isMaked) BOOL maked;
@property (nonatomic, assign, getter=isUpdated) BOOL updated;
@property (nonatomic, assign, getter=isMeatured) BOOL meatured;
@property (nonatomic, assign, getter=isLayouted) BOOL layouted;

@end




NS_ASSUME_NONNULL_END
