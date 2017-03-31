//
//  Demo_A3_QueueTypeViewController.m
//  PlayGround
//
//  Created by liang on 31/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "Demo_A3_QueueTypeViewController.h"
#import "UIViewController+LogUtil.h"

@interface Demo_A3_QueueTypeViewController ()

@end

@implementation Demo_A3_QueueTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_queue_t mainGlobalQueue = dispatch_get_main_queue();
    dispatch_queue_t defaultGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t highGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t lowGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t backgroundGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_queue_t customCocurrentQueue = dispatch_queue_create("me.hite.demo.thread.c1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t customSerialQueue = dispatch_queue_create("me.hite.demo.thread.s1", DISPATCH_QUEUE_SERIAL);
    
    
    [self logBegin:(@"QOS")];
    NSArray *queues = @[mainGlobalQueue, highGlobalQueue, defaultGlobalQueue, lowGlobalQueue, backgroundGlobalQueue, customCocurrentQueue, customSerialQueue];

    for (NSUInteger i = 0; i< queues.count; i++) {
        dispatch_queue_t t = queues[i];
        NSLog(@"%u - dispatch queue label = %s", i, dispatch_queue_get_label(t));
    }
    [self logEnd:(@"QOS")];
    
//    [self logBegin:@"NSOBject performSelector"];
//    long long nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
//    [self performSelectorOnMainThread:@selector(printLogs:) withObject:@(nowTime) waitUntilDone:YES];
//    
////    [self performSelectorInBackground:@selector(printLogs:) withObject:@(nowTime)];
//    [self logEnd:@"NSOBject performSelector"];

}

- (void)printLogs:(id)sender
{
    long long nowTime = [[NSDate date] timeIntervalSince1970] *1000000;
    printf("线程c %zu - %lld \n", index, nowTime);
    NSThread *thread = [NSThread currentThread];
    dispatch_queue_t t = dispatch_get_current_queue();
    
    NSLog(@"线程c %zu -  %lld ; %@, label = %s", index, nowTime, thread , dispatch_queue_get_label(t));
    printf("args = %lld \n", [sender longLongValue]);
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
