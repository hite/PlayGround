//
//  DetailViewController.m
//  PlayGround
//
//  Created by liang on 28/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    
    id __unsafe_unretained obj1 = nil;
    {
        id __strong obj0 = [[NSObject alloc] init];
        
        obj1 = obj0;
        
        NSLog(@"A: %@", obj1);
    }
    
    NSLog(@"B: %@", obj1);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
