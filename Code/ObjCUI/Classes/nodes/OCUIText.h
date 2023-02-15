//
//  OCUIViewNode.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIView.h"

NS_ASSUME_NONNULL_BEGIN

@class OCUIText;
extern OCUIText* Text(NSString *text);
@interface OCUIText : OCUIView

// 为了获得编译提示复写OCUI的属性
OCUIInheritProperty(OCUIText)

OCUIDeclCopy(OCUIText, NSString *, text)

OCUIDeclStrong(OCUIText, UIColor *, textColor)

OCUIDeclAssign(OCUIText, CGFloat, fontSize)

OCUIDeclAssign(OCUIText, UIFontWeight, fontWeight)

@end

NS_ASSUME_NONNULL_END
