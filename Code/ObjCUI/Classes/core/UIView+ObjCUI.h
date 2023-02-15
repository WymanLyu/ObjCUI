//
//  UIView+ObjCUI.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ObjCUI)

@property (nonatomic, strong) OCUIView *ocui_node;

@property (nonatomic, assign) BOOL ocui_building;

- (OCUIView *)body;

@end

NS_ASSUME_NONNULL_END
