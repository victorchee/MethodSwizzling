//
//  NSMutableDictionary+Swizzling.m
//  MethodSwizzling
//
//  Created by qihaijun on 1/19/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

#import "NSMutableDictionary+Swizzling.h"
#import "MethodSwizzling.h"

@implementation NSMutableDictionary(Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(setValue:forKey:) andSwizzledSelector:@selector(swizzled_setValue:forKey:)];
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(setObject:forKey:) andSwizzledSelector:@selector(swizzled_setObject:forKey:)];
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(setObject:forKeyedSubscript:) andSwizzledSelector:@selector(swizzled_setObject:forKeyedSubscript:)];
    });
}

- (void)swizzled_setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"swizzled set value for key");
    if (value && key) {
        [self swizzled_setValue:value forKey:key];
    } else {
        NSLog(@"****************");
    }
}

// 为什么就这个弄不出来，留待日后再说吧。
- (void)swizzled_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    NSLog(@"swizzled set object for key");
    if (anObject && aKey) {
        [self swizzled_setObject:anObject forKey:aKey];
    } else {
        NSLog(@"****************");
    }
}

- (void)swizzled_setObject:(id)object forKeyedSubscript:(id<NSCopying>)aKey
{
    NSLog(@"swizzled set object for keyed subscript");
    if (object && aKey) {
        [self swizzled_setObject:object forKeyedSubscript:aKey];
    } else {
        NSLog(@"****************");
    }
}

@end
