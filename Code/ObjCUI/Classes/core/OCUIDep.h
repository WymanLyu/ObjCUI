//
//  OCUIDep.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCUIDep : NSObject

/** 发布者 */
@property (nonatomic, weak) id publisher;

/** 属性getter */
@property (nonatomic, assign) SEL getter;

/** 属性setter */
@property (nonatomic, assign) SEL setter;

+ (instancetype)Dep:(id)publisher getter:(SEL)getter setter:(SEL)setter;

@end

NS_ASSUME_NONNULL_END
