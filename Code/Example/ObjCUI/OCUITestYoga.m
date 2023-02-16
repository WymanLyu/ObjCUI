//
//  OCUITestYoga.m
//  ObjCUI_Example
//
//  Created by wyman on 2023/2/16.
//  Copyright © 2023 wyman.lyu@gmail.com. All rights reserved.
//

#import "OCUITestYoga.h"
#import "UIView+Yoga.h"

@interface OCUITestYoga ()

@property (nonatomic, strong) OCUITestYoga *contentV;

@end

@implementation OCUITestYoga

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *contentview = [UIView new];
        contentview.layer.borderWidth = 2;
        contentview.layer.borderColor = UIColor.redColor.CGColor;
        [self addSubview:contentview];
        self.contentV = contentview;

        UIImageView *imageview = [UIImageView new];
        imageview.layer.borderWidth = 2;
        imageview.layer.borderColor = UIColor.blueColor.CGColor;
        imageview.image = [UIImage imageNamed:@"testimage"];
        [contentview addSubview:imageview];

        UIView *contentview2 = [UIView new];
        contentview2.layer.borderWidth = 2;
        contentview2.layer.borderColor = UIColor.redColor.CGColor;
        [contentview addSubview:contentview2];

        UILabel *lbl = [UILabel new];
        lbl.layer.borderWidth = 2;
        lbl.layer.borderColor = UIColor.redColor.CGColor;
        lbl.text = @"Weekly Reports";
        [contentview2 addSubview:lbl];

        UILabel *lbl2 = [UILabel new];
        lbl2.layer.borderWidth = 2;
        lbl2.layer.borderColor = UIColor.redColor.CGColor;
        lbl2.text = @"Get a weekly report with insights about your screen time.";
        lbl2.numberOfLines = 0;
        [contentview2 addSubview:lbl2];

        [imageview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(44);
            layout.height = YGPointValue(44);
            layout.marginRight = YGPointValue(10);
        }];
        [lbl configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexGrow = 1;
            layout.flexShrink = 1;
        }];
        [lbl2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexGrow = 1;
            layout.flexShrink = 1;
        }];
        [contentview2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexDirection = YGFlexDirectionColumn;
            layout.justifyContent = YGJustifyFlexStart;
            layout.alignItems = YGAlignFlexStart;
            layout.flexGrow = 1;
            layout.flexShrink = 1;
        }];
        [contentview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexDirection = YGFlexDirectionRow;
            layout.justifyContent = YGJustifyFlexStart;
            layout.alignItems = YGAlignCenter;
            layout.paddingTop = YGPointValue(10);
            layout.paddingBottom = YGPointValue(20);
            layout.paddingLeft = YGPointValue(30);
            layout.paddingRight = YGPointValue(40);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentV.frame = self.bounds;
    [self.contentV.yoga applyLayoutPreservingOrigin:YES];

}
- (CGSize)sizeThatFits:(CGSize)size {
    size.height = YGUndefined;
    CGSize re = [self.contentV.yoga calculateLayoutWithSize:size];
    return re;
}

@end
