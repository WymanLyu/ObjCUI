//
//  OCUIPropertyWrappers.h
//  ObjcUI
//
//  Created by wyman on 2023/2/13.
//  Copyright © 2023 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
@State(NSString *, name) // 重写getter 运行时生成setter(形成了依赖才有setter触发刷新能力)，提供binding的getter函数
@Binding(NSString *, name) // 重写getter 运行时生成setter，提供binding的getter函数，setter和setter函数要操作被绑定的对象，未绑定进行访问则返回nil和0
@EnvironmentObject(NSString *, name) // 重写getter 运行时生成setter ？？？
@ObservableObject(NSString *, name) // 重写getter，加入依赖中
 */

#define State(type, gettername, settername)  dynamic gettername; \
- (type)gettername { \
    SEL getterSel = @selector(gettername); \
    SEL setterSel = @selector(settername); \
    OCUIDep *dep = [OCUIDep Dep:self getter:getterSel  setter:setterSel]; \
    [OCUIContext appendDep:dep]; \
    return objc_getAssociatedObject(self, getterSel); \
} \
- (void)settername(type)gettername { \
    SEL getterSel = @selector(name); \
    SEL setterSel = @selector(settername); \
    objc_setAssociatedObject(self, getterSel, name, OBJC_ASSOCIATION_COPY); \
    OCUIDep *dep = [OCUIDep Dep:self getter:getterSel setter:setterSel]; \
    NSString *notiKey = [NSString stringWithFormat:@"%p-%@", dep.publisher, NSStringFromSelector(getterSel)]; \
    [[NSNotificationCenter defaultCenter] postNotificationName:notiKey object:self]; \
}





#define Binding(type, getter, setter) dynamic getter
#define EnvironmentObject(type, getter, setter) dynamic getter
#define ObservableObject(type, getter, setter) dynamic getter
#define Published(type, getter, setter) dynamic getter

NS_ASSUME_NONNULL_END
