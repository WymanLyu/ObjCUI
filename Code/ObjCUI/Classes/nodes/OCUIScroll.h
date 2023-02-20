//
//  OCUIScroll.h
//  ObjCUI
//
//  Created by wyman on 2023/2/20.
//

#import "OCUIContainer.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCUIScroll : OCUIContainer
extern OCUIScroll* Scroll(ObjCUIBuild b);

@end

@interface OCUIScrollView : UIScrollView

@property (nonatomic, strong, readonly)  UIView *contentFlexView;

@end

NS_ASSUME_NONNULL_END
