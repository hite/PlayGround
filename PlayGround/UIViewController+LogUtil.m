//
//  UIViewController+LogUtil.m
//  PlayGround
//
//  Created by liang on 31/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "UIViewController+LogUtil.h"

@implementation UIViewController (LogUtil)

- (void)logBegin:(NSString *)type
{
    NSLog(@"%@ - log测试开始",type);
}
- (void)logEnd:(NSString *)type
{
    NSLog(@"%@ - log测试结束",type);
}

@end
