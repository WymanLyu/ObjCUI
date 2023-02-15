//
//  OCUIHStack.m
//  ObjCUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIHStack.h"
#import "OCUIContext.h"

OCUIHStack* HStack(ObjCUIBuild b) {
    OCUIHStack *node = [OCUIHStack new];
    node.flexDirection(OCUIFlexDirectionRow)
        .justifyContent(OCUIJustifyFlexStart)
        .alignItems(OCUIAlignCenter);
    [OCUIContext appendNode:node builder:^{
        if (b) {
            b();
        }
    }];
    return node;
}
@implementation OCUIHStack

@end
