//
//  OCUIBuilder.m
//  ObjcUI
//
//  Created by wyman on 2020/12/31.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUINode.h"

@implementation OCUINode

- (void)depNoti:(NSNotification *)noti {
    if ([self.mainResponder respondsToSelector:NSSelectorFromString(@"reloadNodeTree")]) {
        [self.mainResponder performSelector:NSSelectorFromString(@"reloadNodeTree")];
    };
}

@end

