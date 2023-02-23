//
//  OCUIScroll.m
//  ObjCUI
//
//  Created by wyman on 2023/2/20.
//

#import "OCUIScroll.h"
#import "OCUIContext.h"
#import "UIView+Yoga.h"

@interface OCUIScrollView()

@property (nonatomic, strong) UIView *contentView;

@end

OCUIScroll* Scroll(ObjCUIBuild b) {
    OCUIScroll *node = [OCUIScroll new];
    [OCUIContext appendNode:node builder:^{
        if (b) {
            b();
        }
    }];
    return node;
}

@implementation OCUIScroll

- (UIView *)makeUIView {
    OCUIScrollView *scrollView = [OCUIScrollView new];
    // 要做个逻辑如果第一个不是容器的话给他默认塞一个容器 VStack吧
    [self.childs enumerateObjectsUsingBlock:^(OCUINode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:OCUIView.class]) {
            OCUIView *viewNode = (OCUIView *)obj;
            viewNode.ocui_view = [viewNode makeUIView];
            viewNode.ocui_view.yoga.isEnabled = YES;
            [scrollView.contentView addSubview:viewNode.ocui_view];
        }
    }];
    return scrollView;
}

- (void)updateUIView {
    [super updateUIView];
    [self.childs enumerateObjectsUsingBlock:^(OCUINode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:OCUIView.class]) {
            OCUIView *viewNode = (OCUIView *)obj;
            [viewNode updateUIView];
        }
    }];
}

@end

@implementation OCUIScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView = [UIView new];
        [self addSubview:self.contentView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    ;
}

- (UIView *)contentFlexView {
    return self.contentView.subviews.firstObject;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (CGSizeEqualToSize(self.contentSize, CGSizeZero)) {
        CGSize contents = [self sizeThatFits:CGSizeMake(YGUndefined, YGUndefined)];
        self.contentFlexView.frame = CGRectMake(0, 0, contents.width, contents.height);
        [self.contentFlexView.yoga applyLayoutPreservingOrigin:YES];
        self.contentView.frame = self.contentFlexView.bounds;
        self.contentSize = self.contentView.bounds.size;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize s = CGSizeMake(YGUndefined, YGUndefined);
    if (self.contentFlexView.yoga.width.value) {
        s.width = self.contentFlexView.yoga.width.value;
    }
    if (self.contentFlexView.yoga.height.value) {
        s.height = self.contentFlexView.yoga.height.value;
    }
    CGSize contentSize = [self.contentFlexView.yoga calculateLayoutWithSize:s];
    return contentSize;
}

@end
