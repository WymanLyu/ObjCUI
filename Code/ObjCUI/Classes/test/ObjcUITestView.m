//
//  ObjcUITestView.m
//  ObjcUI
//
//  Created by wyman on 2023/2/13.
//  Copyright © 2023 wyman. All rights reserved.
//

#import "ObjcUITestView.h"

#define GetBind(a) (a##Binding)

@interface ObjcUIData : NSObject
@property (nonatomic, assign) CGFloat area;
@property (nonatomic, assign) CGSize range;
@end
@implementation ObjcUIData
@Published(CGSize, range, setRange);
@end

@interface ObjcUITestView()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) int age;

@property (nonatomic, copy) OCUIDep *ageBinding;

@property (nonatomic, strong) ObjcUIData *data;

@end

@implementation ObjcUITestView

//@State(NSString *, name, setName);
//@Binding(OCUIDep *, age, setAge);
//@ObservableObject(ObjcUIData *, data, setData);


- (OCUIView *)body {
    return ZStack(^{
        View([UIButton new]);
        Text(self.name);
//            .state(self.age)
//            .state(self.data.area)
//            .state$(GetBind(self.age));
        ZStack(^{
            Image(@"");
        });
    });
}


@end
