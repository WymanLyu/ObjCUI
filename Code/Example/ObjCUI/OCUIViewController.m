//
//  OCUIViewController.m
//  ObjCUI
//
//  Created by wyman.lyu@gmail.com on 02/14/2023.
//  Copyright (c) 2023 wyman.lyu@gmail.com. All rights reserved.
//

#import "OCUIViewController.h"
#import "ObjCUI.h"
#import "OCUIContext.h"
#import <objc/runtime.h>


@interface OCUIViewController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL showimg;

@end

@implementation OCUIViewController

@State(NSString *, name , setName:)


- (OCUIView *)body {
    return HStack(^{
        
        VStack(^{
            View([UIView new])
                .backgroundColor(UIColor.redColor)
                .width(22).height(88);
            
            Text(self.name)
                .fontSize(14)
                .backgroundColor(UIColor.greenColor);
            
            View([UIView new])
                .backgroundColor(UIColor.blueColor)
                .width(33).height(88);
        });
        
        VStack(^{
            View([UIView new])
                .backgroundColor(UIColor.redColor)
                .width(28).height(28);
            
            if (self.showimg) {
                Image(@"testimage")
                    .width(44).height(44);
            }
            
            View([UIView new])
                .backgroundColor(UIColor.orangeColor)
                .width(48).height(48);
        })
        .backgroundColor(UIColor.greenColor);

    })
    .justifyContent(OCUIJustifySpaceBetween)
    .backgroundColor(UIColor.grayColor)
    .width(300)
    .height(200);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.showimg = YES;
    self.name = @"Hello ObjCUI";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 自动刷新界面 showimg顺序在下面则不会刷新，因为没有包装属性没有建立依赖
    if ([self.name isEqualToString:@"Hello ObjCUI"]) {
        self.showimg = NO;
        self.name = @"你好 ObjCUI!🚀🚀🚀";
    } else {
        self.showimg = YES;
        self.name = @"Hello ObjCUI";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
