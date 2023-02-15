//
//  OCUIImageNode.h
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIView.h"

NS_ASSUME_NONNULL_BEGIN

@class OCUIImage;
extern OCUIImage* Image(NSString *imageSrc);
@interface OCUIImage : OCUIView

// 为了获得编译提示复写OCUI的属性
OCUIInheritProperty(OCUIImage)

OCUIDeclCopy(OCUIImage, NSString *, imageSrc)

OCUIDeclStrong(OCUIImage, UIImage *, image)

@end

NS_ASSUME_NONNULL_END
