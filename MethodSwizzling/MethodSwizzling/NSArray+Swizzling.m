//
//  NSArray+Swizzling.m
//  MethodSwizzling
//
//  Created by qihaijun on 1/19/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

#import "NSArray+Swizzling.h"
#import "MethodSwizzling.h"

@implementation NSArray(Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [MethodSwizzling swizzleMethodWithClass:[self class] originalSelector:@selector(objectAtIndexedSubscript:) andSwizzledSelector:@selector(swizzled_objectAtIndexedSubscript:)];
    });
}

- (id)swizzled_objectAtIndexedSubscript:(NSUInteger)idx
{
    NSLog(@"swizzled object at indexed subscript");
    if (idx < self.count) {
        return [self swizzled_objectAtIndexedSubscript:idx];
    } else {
        return nil;
    }
}

@end
