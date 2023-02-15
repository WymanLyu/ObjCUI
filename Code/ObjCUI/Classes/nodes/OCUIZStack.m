//
//  OCUIZStack.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIZStack.h"
#import "OCUIContext.h"

OCUIZStack* ZStack(ObjCUIBuild b) {
    OCUIZStack *node = [OCUIZStack new];
    [OCUIContext appendNode:node builder:^{
        if (b) {
            b();
        }
    }];
    return node;
}

@implementation OCUIZStack

@end
