//
//  MethodSwizzling.h
//  MethodSwizzling
//
//  Created by qihaijun on 1/19/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MethodSwizzling : NSObject

+ (void)swizzleMethodWithClass:(Class)class originalSelector:(SEL)originalSelector andSwizzledSelector:(SEL)swizzledSelector;

@end
