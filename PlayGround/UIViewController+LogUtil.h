//
//  UIViewController+LogUtil.h
//  PlayGround
//
//  Created by liang on 31/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LogUtil)

- (void)logBegin:(NSString *)type;
- (void)logEnd:(NSString *)type;

@end
