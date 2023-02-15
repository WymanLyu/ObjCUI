//
//  OCUIVStack.m
//  ObjCUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIVStack.h"
#import "OCUIContext.h"

OCUIVStack* VStack(ObjCUIBuild b) {
    OCUIVStack *node = [OCUIVStack new];
    node.flexDirection(OCUIFlexDirectionColumn)
        .justifyContent(OCUIJustifyFlexStart)
        .alignItems(OCUIAlignCenter);
    [OCUIContext appendNode:node builder:^{
        if (b) {
            b();
        }
    }];
    return node;
}
@implementation OCUIVStack

@end
