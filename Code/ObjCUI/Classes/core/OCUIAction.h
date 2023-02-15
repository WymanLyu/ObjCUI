//
//  OCUIAction.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCUIAction : NSObject

@property (nonatomic, weak) id target;

@property (nonatomic, assign) SEL sel;

@property (nonatomic, assign) UIControlEvents events;

@end

NS_ASSUME_NONNULL_END
