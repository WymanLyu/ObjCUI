//
//  OCUIImageNode.m
//  ObjcUI
//
//  Created by wyman on 2020/4/9.
//  Copyright © 2020 wyman. All rights reserved.
//

#import "OCUIImage.h"
#import "OCUIContext.h"

OCUIImage* Image(NSString *imageSrc) {
    OCUIImage *node = [OCUIImage new];
    node.imageSrc(imageSrc);
    [OCUIContext appendNode:node];
    return node;
}
@implementation OCUIImage

OCUIImpl(OCUIImage, NSString *, imageSrc)

OCUIImpl(OCUIImage, UIImage *, image)

- (UIView *)makeUIView {
    UIImageView *label = [UIImageView new];
    return label;
}

- (void)updateUIView {
    [super updateUIView];
    UIImageView *imageView = (UIImageView *)self.ocui_view;
    if (self.ocui_imageSrcSetted) imageView.image = [UIImage imageNamed:self.ocui_imageSrc];
    if (self.ocui_imageSetted) imageView.image = self.ocui_image;
}

@end
