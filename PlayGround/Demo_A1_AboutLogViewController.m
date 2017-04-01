//
//  Demo_A1_ViewController.m
//  PlayGround
//
//  Created by liang on 30/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "Demo_A1_AboutLogViewController.h"
#include <pthread.h>

@interface Demo_A1_AboutLogViewController ()

@end

@implementation Demo_A1_AboutLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"普通 - 主线程 - log测试开始");
//    for (int i = 0; i < 5; i++) {
//        long long nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
//        NSLog(@"主线程 NSLog = %d -  time = %lld", i, nowTime);
//        printf("主线程 printf = %d - time = %lld\n", i, nowTime);
//    }
////    mach_port_t machTID = pthread_mach_thread_np(pthread_self());
////    NSLog(@"main thread: %x", machTID);
//    NSLog(@"测试结束");
    NSLog(@"并发 - log测试开始");
    dispatch_apply(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(size_t index) {
        // index则为执行的次数 0开始递增
        long long nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
        printf("线程c %zu - %lld \n", index, nowTime);
        
        NSThread *thread = [NSThread currentThread];
        dispatch_queue_t t = dispatch_get_current_queue();
        const char* utf8String = [thread.name UTF8String];
//        nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
        // 在这儿设置断点之后，只会响应一次
        NSLog(@"线程c %zu -  %lld ; %@", index, nowTime, thread /*, dispatch_queue_get_label(t)*/);
//        mach_port_t machTID = pthread_mach_thread_np(pthread_self());
//        NSLog(@"current thread: %x", machTID);
    });
    NSLog(@"测试结束");
    
    NSLog(@"串行 - log测试开始");
    dispatch_queue_t serialQueue = dispatch_queue_create("me.hite.demo.thread.1", DISPATCH_QUEUE_SERIAL);
    dispatch_apply(4, serialQueue, ^(size_t index) {
        // index则为执行的次数 0开始递增
        long long nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
        printf("线程s %zu - %lld \n", index, nowTime);
        NSThread *thread = [NSThread currentThread];
        dispatch_queue_t t = dispatch_get_current_queue();
        
        const char* utf8String = [thread.name UTF8String];
        nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
        NSLog(@"线程s %zu -  %lld ; %@", index, nowTime, thread /*, dispatch_queue_get_label(t)*/);
    });
    NSLog(@"测试结束");
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
