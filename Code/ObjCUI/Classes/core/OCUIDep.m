//
//  OCUIDep.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIDep.h"

@implementation OCUIDep

+ (instancetype)Dep:(id)publisher getter:(SEL)getter setter:(SEL)setter {
    OCUIDep *dep = [OCUIDep new];
    dep.publisher = publisher;
    dep.getter = getter;
    dep.setter = setter;
    return dep;
}

@end
