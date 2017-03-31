//
//  ThreadDemoViewController.m
//  PlayGround
//
//  Created by liang on 29/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "ThreadDemoViewController.h"

@interface ThreadDemoViewController (){
    NSLock *_lock;
}

@end

@implementation ThreadDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    _lock = [NSLock new];
    [self globalThread];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void realFunction(void *input){
        NSThread *thread = [NSThread currentThread];
        NSLog(@"线程c - %@", thread);
}
- (void)globalThread
{
    dispatch_queue_t mainGlobalQueue = dispatch_get_main_queue();
    dispatch_queue_t defaultGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t highGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t lowGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t backgroundGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_queue_t customCocurrentQueue = dispatch_queue_create("me.hite.demo.thread.1", nil);
   
    
//    NSLog(@"QOS测试开始");
//    NSArray *queues = @[mainGlobalQueue, highGlobalQueue, defaultGlobalQueue, lowGlobalQueue, backgroundGlobalQueue, customCocurrentQueue];
//    
//    for (NSUInteger i = 0; i< queues.count; i++) {
//        dispatch_queue_t t = queues[i];
//        NSLog(@"%u - dispatch queue label = %s", i, dispatch_queue_get_label(t));
//    }
//    NSLog(@"测试结束");
//    NSLog(@"异步 - 并发 - 线程测试开始");
//    for (NSInteger i = 0; i< 10; i++) {
//        dispatch_async(defaultGlobalQueue, ^{
//            NSThread *thread = [NSThread currentThread];
//            NSLog(@"线程a %d - %@", i, thread);
//        });
//    }
//    NSLog(@"测试结束");
//    NSLog(@"同步 - 并发 - 线程测试开始");
//    for (NSInteger i = 0; i< 10; i++) {
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSThread *thread = [NSThread currentThread];
//            NSLog(@"线程b %d - %@", i, thread);
//        });
//    }
//    NSLog(@"测试结束");
//    NSLog(@"同步 - 并发f - 线程测试开始");
//    for (NSInteger i = 0; i< 10; i++) {
//        dispatch_async_f(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), nil, realFunction);
//    }
//    NSLog(@"测试结束");

//    NSLog(@"异步 - 主线程 - printf - 线程测试开始");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        // some task to perform
//        printf("This is printf");
////        NSLog(@"This is NSLog");
//    });
//    NSLog(@"测试结束");
}

- (void)log
{
    [_lock lock];
    printf("Log start!\n");
    [NSThread sleepForTimeInterval:1];
    printf("Log end.\n");
    [_lock unlock];
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
