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
#import "OCUITestYoga.h"
#import "OCUITestCustomView.h"


@interface OCUIViewController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL showimg;

@property (nonatomic, strong) OCUITestYoga *cell;
@property (nonatomic, strong) OCUITestCustomView *customcell;

@end

@implementation OCUIViewController

@State(NSString *, name , setName:)


// 0 则显示body
// 1 则显示OCUITestYoga *cell
// 2 则显示OCUITestCustomView *customcell
- (int)testYogaView {
    return 0;
//    return 1;
//    return 2;
}

- (OCUIView *)body {
    if ([self testYogaView]) return nil;
    return Scroll(^{
             VStack(^{
            
            Image(@"testimage")
                .width(64)
                .height(64)
                .marginTop(120);
            
            Scroll(^{
                HStack(^{
                    for (NSNumber *_ in @[@(1),@(1),@(1),@(1),@(1),@(1),@(1),@(1),@(1)]) {
                        Image(@"testimage")
                            .width(64)
                            .height(64)
                            .marginRight(10);
                    }
                })
                .alignSelf(OCUIAlignFlexStart); // 不要剧中排列
            });
            
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
            
            for (NSNumber* _ in @[@(1),@(2),@(3),@(4),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5),@(5)]) {
                NSString *title = @"Weekly Reports";
                NSString *subtitle = @"Get a weekly report with insights about your screen time.";
                
                if (_.intValue == 1) {
                    // 用自定义view实现
                    View(OCUITestCustomView.new)
                        .setupUI(^(__kindof OCUITestCustomView * v) {
                            v.title = title;
                            v.subtitle = subtitle;
                            v.backgroundColor = [UIColor lightGrayColor];
                        });
                } else if (_.intValue == 2) {
                    // 用传统的view
                    View(OCUITestYoga.new)
                        .setupUI(^(__kindof OCUITestCustomView * v) {
                            v.backgroundColor = [UIColor yellowColor];
                        });
                } else {
                    // 用导出的node接口
                    TestCellNode()
                        .title(title)
                        .subtitle(subtitle)
                        .backgroundColor([UIColor orangeColor]);
                }
            }
        })
        .backgroundColor(UIColor.whiteColor);
    });
    
//    return VStack(^{
//
//        Image(@"testimage")
//            .width(64)
//            .height(64)
//            .marginTop(120);
//
//        Text(@"Screen Time")
//            .fontSize(22)
//            .fontWeight(UIFontWeightBold)
//            .textColor(UIColor.blackColor)
//            .marginLeft(20)
//            .marginRight(20)
//            .marginBottom(40);
//
//        Text(@"Get insights about your screen time and set limits for what you want to manage.")
//            .numberOfLines(0)
//            .fontSize(18)
//            .textColor(UIColor.blackColor)
//            .marginLeft(20)
//            .marginRight(20)
//            .marginBottom(40);
//
//        for (NSNumber* _ in @[@(1),@(2),@(3),@(4)]) {
//            NSString *title = @"Weekly Reports";
//            NSString *subtitle = @"Get a weekly report with insights about your screen time.";
//
//            if (_.intValue == 1) {
//                // 用自定义view实现
//                View(OCUITestCustomView.new)
//                    .setupUI(^(__kindof OCUITestCustomView * v) {
//                        v.title = title;
//                        v.subtitle = subtitle;
//                        v.backgroundColor = [UIColor lightGrayColor];
//                    });
//            } else if (_.intValue == 2) {
//                // 用传统的view
//                View(OCUITestYoga.new)
//                    .setupUI(^(__kindof OCUITestCustomView * v) {
//                        v.backgroundColor = [UIColor yellowColor];
//                    });
//            } else {
//                // 用导出的node接口
//                TestCellNode()
//                    .title(title)
//                    .subtitle(subtitle)
//                    .backgroundColor([UIColor orangeColor]);
//            }
//        }
//    })
//    .backgroundColor(UIColor.whiteColor);
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
    
    self.cell = [OCUITestYoga new];
    self.cell.hidden = ([self testYogaView] != 1);
    [self.view addSubview:self.cell];
    
    self.customcell = [OCUITestCustomView new];
    self.customcell.hidden = ([self testYogaView] != 2);
    [self.view addSubview:self.customcell];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews ];
    if ([self testYogaView] == 1) {
        CGSize s = [self.cell sizeThatFits:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)];
        self.cell.bounds = CGRectMake(0, 0, self.view.frame.size.width, s.height);
        self.cell.center = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
    }
    if ([self testYogaView] == 2) {
        CGSize s = [self.customcell sizeThatFits:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)];
        self.customcell.bounds = CGRectMake(0, 0, self.view.frame.size.width, s.height);
        self.customcell.center = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
    }
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
