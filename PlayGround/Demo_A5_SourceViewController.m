//
//  Demo_A5_SourceViewController.m
//  PlayGround
//
//  Created by liang on 31/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "Demo_A5_SourceViewController.h"

@interface Demo_A5_SourceViewController ()

@end

@implementation Demo_A5_SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(test)];
}

- (void)test
{
    // 基本用法
    dispatch_queue_t globalQueue = dispatch_get_main_queue();
    dispatch_queue_t backgroundGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_queue_t utilbackgroundGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, globalQueue);
    
    __block unsigned long start = 0;
    dispatch_source_set_event_handler(source, ^{
        unsigned long increment = dispatch_source_get_data(source);
        start += increment;
        NSLog(@"increment = %lu progressor is %lu", increment, start);
    });
    dispatch_resume(source);
    
    NSLog(@"位置1");
    dispatch_async(utilbackgroundGlobalQueue, ^{
        NSLog(@"位置3");
        // 100个任务，都要同步执行完毕，打开停留 50s 之内，主线程停留了5s，可以模拟
        dispatch_apply(100, backgroundGlobalQueue, ^(size_t index) {
            // do some work on data at index
            [NSThread sleepForTimeInterval:0.5];
            dispatch_source_merge_data(source, 1);
            NSLog(@"dispatch_source_merge_data, index = %zu", index);
        });
    });
    NSLog(@"位置2");
    // 模拟主线程比较忙的情况；
    // 本行，测试主线程比较忙的情况,持续5分钟
    [NSThread sleepForTimeInterval:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
