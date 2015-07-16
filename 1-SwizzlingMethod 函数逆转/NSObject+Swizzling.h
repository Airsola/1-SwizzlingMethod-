//
//  NSObject+Swizzling.h
//  1-SwizzlingMethod 函数逆转
//
//  Created by summer on 15/7/16.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (swizzle)
- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
