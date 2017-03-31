//
//  MasterViewController.h
//  PlayGround
//
//  Created by liang on 28/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

@interface DemoMapper : NSObject

@property (nonatomic, strong) NSString *demoName;

@property (nonatomic, strong) Class clzName;

@end
