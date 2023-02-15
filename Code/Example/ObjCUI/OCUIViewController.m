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

@interface OCUITestCell : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end

@implementation OCUITestCell

- (OCUIView *)body {
    return HStack(^{
        Image(@"testimage")
            .width(44)
            .height(44)
            .marginRight(10);
        Flex(^{
            Text(@"Weekly Reports")
                .fontWeight(UIFontWeightBold)
                .fontSize(18);
            Text(@"Get a weekly report with insights about your screen time.")
                .numberOfLines(0)
                .textColor(UIColor.grayColor)
                .fontSize(18);
        })
        .flexDirection(OCUIFlexDirectionColumn);
    })
    .marginTop(10)
    .marginBottom(10)
    .marginLeft(20)
    .marginRight(20);
}

@end

@interface OCUITestCellNode : OCUIView
extern OCUITestCellNode* TestCellNode();

OCUIDeclCopy(OCUITestCellNode, NSString *, title)
OCUIDeclCopy(OCUITestCellNode, NSString *, subtitle)

@end


@implementation OCUITestCellNode
OCUITestCellNode* TestCellNode(void) {
    OCUITestCellNode *node = [OCUITestCellNode new];
    [OCUIContext appendNode:node];
    return node;
}

OCUIImpl(OCUITestCellNode, NSString *, title)
OCUIImpl(OCUITestCellNode, NSString *, subtitle)

- (UIView *)makeUIView {
    OCUITestCell *c = [OCUITestCell new];
    return c;
}

- (void)updateUIView {
    [super updateUIView];
    [(OCUITestCell *)self.ocui_view setTitle:self.ocui_title];
    [(OCUITestCell *)self.ocui_view setTitle:self.ocui_subtitle];
}

@end


@interface OCUIViewController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL showimg;

@end

@implementation OCUIViewController

@State(NSString *, name , setName:)


- (OCUIView *)body {
    return VStack(^{
        
        Image(@"testimage")
            .width(64)
            .height(64)
            .marginTop(120);
        
        Text(@"Screen Time")
            .fontSize(22)
            .fontWeight(UIFontWeightBold)
            .textColor(UIColor.blackColor)
            .marginLeft(20)
            .marginRight(20)
            .marginBottom(40);
        
        Text(@"Get insights about your screen time and set limits for what you want to manage.")
            .numberOfLines(0)
            .fontSize(18)
            .textColor(UIColor.blackColor)
            .marginLeft(20)
            .marginRight(20)
            .marginBottom(40);
        
        for (id i in @[@(1),@(2),@(3),@(4)]) {
            NSString *title = @"Weekly Reports";
            NSString *subtitle = @"Get a weekly report with insights about your screen time.";
            TestCellNode()
                .title(title)
                .subtitle(subtitle);
        }
    })
    .backgroundColor(UIColor.whiteColor);
}

//- (OCUIView *)body {
//    return HStack(^{
//
//        VStack(^{
//            View([UIView new])
//                .backgroundColor(UIColor.redColor)
//                .width(22).height(88);
//
//            Text(self.name)
//                .fontSize(14)
//                .backgroundColor(UIColor.greenColor);
//
//            View([UIView new])
//                .backgroundColor(UIColor.blueColor)
//                .width(33).height(88);
//        });
//
//        VStack(^{
//            View([UIView new])
//                .backgroundColor(UIColor.redColor)
//                .width(28).height(28);
//
//            if (self.showimg) {
//                Image(@"testimage")
//                    .width(44).height(44);
//            }
//
//            View([UIView new])
//                .backgroundColor(UIColor.orangeColor)
//                .width(48).height(48);
//        })
//        .backgroundColor(UIColor.greenColor);
//
//    })
//    .justifyContent(OCUIJustifySpaceBetween)
//    .backgroundColor(UIColor.grayColor);
//}


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
