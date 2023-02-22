//
//  OCUISpacer.h
//  ObjCUI
//
//  Created by wyman on 2023/2/22.
//

#import "OCUIView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCUISpacer : OCUIView
extern OCUISpacer* Spacer(CGFloat minLength);

// 为了获得编译提示复写OCUI的属性
OCUIInheritProperty(OCUISpacer)

OCUIDeclAssign(OCUISpacer, CGFloat, minLength)

@end

NS_ASSUME_NONNULL_END
