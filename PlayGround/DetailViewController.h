//
//  DetailViewController.h
//  PlayGround
//
//  Created by liang on 28/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

