//
//  OCUISpacer.m
//  ObjCUI
//
//  Created by wyman on 2023/2/22.
//

#import "OCUISpacer.h"
#import "OCUIContext.h"
#import "OCUIContainer.h"
#import "UIView+Yoga.h"
#import "OCUIFlex.h"

@implementation OCUISpacer
OCUISpacer* Spacer(CGFloat minLength) {
    OCUISpacer *node = [OCUISpacer new];
    node.flexGrow(1);
    node.minLength(minLength);
    [OCUIContext appendNode:node];
    return node;
}

OCUIImpl(OCUISpacer, CGFloat, minLength)

- (UIView *)makeUIView {
    return [UIView new];
}

- (void)updateUIView {
    [super updateUIView];
    [self.ocui_view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        if ([self.parent isKindOfClass:OCUIFlex.class]) {
            OCUIFlex *flex = (OCUIFlex *)self.parent;
            if (flex.ocui_flexDirection == OCUIFlexDirectionRow) {
                layout.minWidth = YGPointValue(self.ocui_minLength);
            } else if (flex.ocui_flexDirection == OCUIFlexDirectionColumn) {
                layout.minHeight = YGPointValue(self.ocui_minLength);
            }
        }
    }];
}


@end
