//
//  Demo_A2_SyncViewController.m
//  PlayGround
//
//  Created by liang on 31/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "Demo_A2_SyncViewController.h"

@interface Demo_A2_SyncViewController ()

@end

@implementation Demo_A2_SyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    dispatch_queue_t defaultGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
    [self logBegin:@"异步 - 并发 - 线程"];
    for (NSInteger i = 0; i< 10; i++) {
        dispatch_async(defaultGlobalQueue, ^{
            NSThread *thread = [NSThread currentThread];
            long long nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
            printf("-> = %d \n", i);
            NSLog(@"线程a %d at %lld - %@", i, nowTime, thread);
        });
    }
    [self logEnd:(@"异步 - 并发 - 线程")];
    
//    [self logBegin:(@"同步 - 并发 - 线程")];
//    for (NSInteger i = 0; i< 10; i++) {
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSThread *thread = [NSThread currentThread];
//            NSLog(@"线程b %d - %@", i, thread);
//        });
//    }
//    [self logEnd:(@"同步 - 并发 - 线程")];
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
