//
//  OCUITestCustomView.m
//  ObjCUI_Example
//
//  Created by wyman on 2023/2/16.
//  Copyright © 2023 wyman.lyu@gmail.com. All rights reserved.
//

#import "OCUITestCustomView.h"
#import "OCUIContext.h"
#import <objc/runtime.h>

@implementation OCUITestCellNode
OCUITestCellNode* TestCellNode(void) {
    OCUITestCellNode *node = [OCUITestCellNode new];
    [OCUIContext appendNode:node];
    return node;
}

OCUIImpl(OCUITestCellNode, NSString *, title)
OCUIImpl(OCUITestCellNode, NSString *, subtitle)

- (UIView *)makeUIView {
    OCUITestCustomView *c = [OCUITestCustomView new];
    return c;
}

- (void)updateUIView {
    [super updateUIView];
    [(OCUITestCustomView *)self.ocui_view setTitle:self.ocui_title];
    [(OCUITestCustomView *)self.ocui_view setTitle:self.ocui_subtitle];
}

@end

@implementation OCUITestCustomView

- (OCUIView *)body {
    return HStack(^{
        Image(@"testimage")
            .borderWidth(2)
            .borderColor(UIColor.redColor)
            .marginRight(10)
            .width(44)
            .height(44);

        Flex(^{
            Text(@"Weekly Reports")
                .borderWidth(2)
                .borderColor(UIColor.redColor)
                .fontWeight(UIFontWeightBold)
                .fontSize(18);
            Text(@"Get a weekly report with insights about your screen time.Get a weekly report with insights about your screen time.Get a weekly report with insights about your screen time.Get a weekly report with insights about your screen time.Get a weekly report with insights about your screen time.")
                .borderWidth(2)
                .borderColor(UIColor.redColor)
                .numberOfLines(0)
                .textColor(UIColor.grayColor)
                .fontSize(18);
        })
        .borderWidth(2)
        .borderColor(UIColor.redColor)
        .flexDirection(OCUIFlexDirectionColumn);
    })
    .borderWidth(2)
    .borderColor(UIColor.redColor)
    .paddingTop(10)
    .paddingBottom(10)
    .paddingLeft(40)
    .paddingRight(40);
}


@end
