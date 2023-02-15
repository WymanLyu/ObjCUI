//
//  OCUIContainerNode.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIContainer.h"

@implementation OCUIContainer

- (instancetype)init {
    if (self = [super init]) {
        self.childs = [NSMutableArray array];
    }
    return self;
}


@end
