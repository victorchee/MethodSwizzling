//
//  UIControl+Swizzling.m
//  MethodSwizzling
//
//  Created by qihaijun on 1/19/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

#import "UIControl+Swizzling.h"
#import "MethodSwizzling.h"

@implementation UIControl(Swizzling)

@dynamic identifier;

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(sendAction:to:forEvent:) andSwizzledSelector:@selector(swizzled_sendAction:to:forEvent:)];
    });
}

- (void)swizzled_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self swizzled_sendAction:action to:target forEvent:event];
    NSLog(@"swizzled control send action");
}

- (void)setIdentifier:(NSString *)identifier
{
    [self willChangeValueForKey:@"identifier"];
    objc_setAssociatedObject(self, @"AssociatedIdentifierKey", identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"identifier"];
}

- (NSString *)identifier
{
    return objc_getAssociatedObject(self, @"AssociatedIdentifierKey");
}

@end
