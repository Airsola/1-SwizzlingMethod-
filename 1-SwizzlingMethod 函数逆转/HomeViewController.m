//
//  HomeViewController.m
//  1-SwizzlingMethod 函数逆转
//
//  Created by ccguo on 15/7/16.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:@"a"];
    [array addObject:nil];
    NSLog(@"%@",[array objectAtIndex:10]);
}

@end
