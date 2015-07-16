//
//  NSMutableSafeArray.m
//  1-SwizzlingMethod 函数逆转
//
//  Created by summer on 15/7/16.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "NSMutableSafeArray.h"
#import "NSObject+Swizzling.h"

@implementation NSMutableArray (safe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(addObject:) withMethod:@selector(safeAddObject:)];
        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
        [obj swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(safeInsertObject:atIndex:)];
        [obj swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(safeRemoveObjectAtIndex:)];
        [obj swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(safeReplaceObjectAtIndex:withObject:)];
    });
}

- (void)safeAddObject:(id)anObject
{
    if (anObject) {
        [self safeAddObject:anObject];
    }else{
        NSLog(@"obj is nil");
        
    }
}

- (id)safeObjectAtIndex:(NSInteger)index
{
    if(index<[self count]){
        return [self safeObjectAtIndex:index];
    }else{
        NSLog(@"index is beyond bounds ");
    }
    return nil;
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= [self count]) {
        [self safeInsertObject:anObject atIndex:index];
    }else{
        NSLog(@"obj is nil or index is beyond bounds ");
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < [self count]) {
        [self safeRemoveObjectAtIndex:index];
    }else{
        NSLog(@"index is beyond bounds ");
    }
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index <= [self count]) {
        [self safeReplaceObjectAtIndex:index withObject:anObject];
    }else{
        NSLog(@"index is beyond bounds ");
    }
}
@end
