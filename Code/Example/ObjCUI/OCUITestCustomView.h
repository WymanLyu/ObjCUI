//
//  OCUITestCustomView.h
//  ObjCUI_Example
//
//  Created by wyman on 2023/2/16.
//  Copyright © 2023 wyman.lyu@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCUI.h"

NS_ASSUME_NONNULL_BEGIN

// 导出点语法的 类似swiftUI的UIViewRepresentable
@interface OCUITestCellNode : OCUIView
extern OCUITestCellNode* TestCellNode();
OCUIInheritProperty(OCUITestCellNode)
OCUIDeclCopy(OCUITestCellNode, NSString *, title)
OCUIDeclCopy(OCUITestCellNode, NSString *, subtitle)
@end

@interface OCUITestCustomView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) UIView *contentV;

@end

NS_ASSUME_NONNULL_END
