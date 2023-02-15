//
//  OCUIContext.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUINode.h"
#import "OCUIDep.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCUIContext : NSObject

+ (instancetype)currentCtx;
+ (void)clearCtx;
+ (void)executeBuildBody:(void(^)(void))builder;
+ (void)appendNode:(OCUINode *)node;
+ (void)appendNode:(OCUINode *)node builder:(void(^)(void))builder;
+ (void)appendDep:(OCUIDep *)dep;

@end

NS_ASSUME_NONNULL_END
