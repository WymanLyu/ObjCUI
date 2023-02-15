//
//  OCUITextNode.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIText.h"
#import "OCUIContext.h"

OCUIText* Text(NSString *text) {
    OCUIText *node = [OCUIText new];
    node.text(text);
    [OCUIContext appendNode:node];
    return node;
}
@implementation OCUIText

OCUIImpl(OCUIText, NSString *, text)

OCUIImpl(OCUIText, UIColor *, textColor)

OCUIImpl(OCUIText, CGFloat, fontSize)

OCUIImpl(OCUIText, UIFontWeight, fontWeight)

- (UIView *)makeUIView {
    UILabel *label = [UILabel new];
    return label;
}

- (void)updateUIView {
    [super updateUIView];
    UILabel *label = (UILabel *)self.ocui_view;
    if (self.ocui_textSetted) label.text = self.ocui_text;
    if (self.ocui_textColor) label.textColor = self.ocui_textColor;
    if (self.ocui_fontSize) label.font = [UIFont systemFontOfSize:self.ocui_fontSize];
    if (self.ocui_fontWeightSetted && self.ocui_fontSize) label.font = [UIFont systemFontOfSize:self.ocui_fontSize weight:self.ocui_fontWeight];
}

@end
