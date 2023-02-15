//
//  OCUIContext.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIContext.h"
#import "OCUIContainer.h"

@interface OCUINodeStack : NSObject

@property (nonatomic, weak, readonly) OCUINode *firstNode;
@property (nonatomic, weak, readonly) OCUINode *lastNode;
@property (nonatomic, assign, readonly) BOOL isEmpty;

- (void)push:(OCUINode *)node;
- (OCUINode *)pop;

@end

@interface OCUIContext()

@property (nonatomic, strong) OCUINodeStack *nodeStack;

@property (nonatomic, strong) OCUIContainer *lastContainer;

@end


@implementation OCUIContext

- (instancetype)init {
    if (self = [super init]) {
        self.nodeStack = [OCUINodeStack new];
    }
    return self;
}

+ (instancetype)currentCtx {
    OCUIContext *ctx = [[[NSThread currentThread] threadDictionary] objectForKey:@"OCUICurrentCtx"];
    if (!ctx) {
        ctx = [OCUIContext new];
        [[[NSThread currentThread] threadDictionary] setObject:ctx forKey:@"OCUICurrentCtx"];
    }
    return ctx;
}

+ (void)executeBuildBody:(void(^)(void))builder {
    [OCUIContext currentCtx];
    if (builder) {
        builder();
    }
    [OCUIContext clearCtx];
}

+ (void)appendNode:(OCUINode *)node {
    [self appendNode:node builder:nil];
}

+ (void)appendNode:(OCUINode *)node builder:(void(^)(void))builder {
    if (!OCUIContext.currentCtx) {
        NSLog(@"[OCUI] 请在body方法中构造ObjCUI元素");
        return;
    }
    [OCUIContext.currentCtx push:node];
    if (builder) {
        builder();
    }
    [OCUIContext.currentCtx pop:node];
}

+ (void)clearCtx {
    [[[NSThread currentThread] threadDictionary] removeObjectForKey:@"OCUICurrentCtx"];
}

+ (void)appendDep:(OCUIDep *)dep {
    if (!OCUIContext.currentCtx) {
        NSLog(@"[OCUI] 请在body方法中构造ObjCUI元素");
        return;
    }
    if (!dep || !NSStringFromSelector(dep.getter).length) {
        return;
    }
    
    NSString *notiKey = [NSString stringWithFormat:@"%p-%@", dep.publisher, NSStringFromSelector(dep.getter)];
    OCUINode *topNode = OCUIContext.currentCtx.nodeStack.firstNode;
    [topNode.deps setObject:dep forKey:notiKey];
    [[NSNotificationCenter defaultCenter] addObserver:topNode selector:NSSelectorFromString(@"depNoti:") name:notiKey object:dep.publisher];
}

- (void)push:(OCUINode *)node {
    if (!node) {
        NSLog(@"[OCUI] node nil!");
        return;
    }
    
    if (self.nodeStack.isEmpty && ![node isKindOfClass:OCUIContainer.class]) {
        NSLog(@"[OCUI] 不能作为初始Node！");
        // TODO
        // 默认插一个居中的Builder
        return;
    }
    node.topNode = (OCUIContainer *)(self.nodeStack.firstNode?:node);
    node.parent = (OCUIContainer *)(self.nodeStack.lastNode?:node);
    [self.nodeStack.lastNode.childs addObject:node];
    if ([node isKindOfClass:OCUIContainer.class]) {
        node.parent = (OCUIContainer *)node;
        [self.nodeStack push:node];
    }
}

- (void)pop:(OCUINode *)node {
    if (!node) {
        NSLog(@"[OCUI] node nil!");
        return;
    }
    if (node == self.nodeStack.lastNode) {
        [self.nodeStack pop];
    } else {
        if ([node isMemberOfClass:OCUIContainer.class]) {
            NSLog(@"[OCUI] builder error!");
        }
    }
}

@end


@interface OCUINodeStack ()
@property (nonatomic, strong) NSMutableArray<OCUINode *> *arrM;

@end

@implementation OCUINodeStack

- (instancetype)init {
    if (self = [super init]) {
        self.arrM = [NSMutableArray array];
        
    }
    return self;
}

- (void)push:(OCUINode *)builder {
    if (builder) {
        [self.arrM addObject:builder];
    }
}

- (OCUINode *)pop {
    OCUINode *lastObject = self.arrM.lastObject;
    [self.arrM removeLastObject];
    return lastObject;
}

- (OCUINode *)firstNode {
    return self.arrM.firstObject;
}

- (OCUINode *)lastNode {
    return self.arrM.lastObject;
}

- (BOOL)isEmpty {
    return !self.arrM.count;
}


@end
