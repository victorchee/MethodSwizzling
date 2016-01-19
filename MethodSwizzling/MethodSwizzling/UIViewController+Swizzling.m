//
//  UIViewController+Swizzling.m
//  MethodSwizzling
//
//  Created by qihaijun on 1/19/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#include "MethodSwizzling.h"

@implementation UIViewController(Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(viewDidAppear:) andSwizzledSelector:@selector(swizzled_viewDidAppear:)];
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(viewDidDisappear:) andSwizzledSelector:@selector(swizzled_viewDidDisappear:)];
    });
}

- (void)swizzled_viewDidAppear:(BOOL)animated
{
    [self swizzled_viewDidAppear:animated];
    NSLog(@"swizzled view did appear");
}

- (void)swizzled_viewDidDisappear:(BOOL)animated
{
    [self swizzled_viewDidDisappear:animated];
    NSLog(@"swizzled view did disappear");
}

@end
