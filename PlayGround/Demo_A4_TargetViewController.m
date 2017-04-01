//
//  Demo_A4_TargetViewController.m
//  PlayGround
//
//  Created by liang on 31/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "Demo_A4_TargetViewController.h"
#import "UIViewController+LogUtil.h"

@interface Demo_A4_TargetViewController ()

@end

@implementation Demo_A4_TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 测试dispatch_set_target_queue的效果
    [self logBegin:(@"Target")];
    
    dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL,QOS_CLASS_UTILITY, -14);
    dispatch_queue_t customSerialQueue = dispatch_queue_create("me.hite.demo.thread.s1", attr);
    dispatch_queue_t customSerialQueue2 = dispatch_queue_create("me.hite.demo.thread.s2", attr);
    dispatch_queue_t defaultGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t customCocurrentQueue = dispatch_queue_create("me.hite.demo.thread.c1", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_set_target_queue(customCocurrentQueue, customSerialQueue);
    NSArray *queues = @[defaultGlobalQueue, customCocurrentQueue, customSerialQueue, customSerialQueue2];
    
    for (NSUInteger i = 0; i< queues.count; i++) {
        dispatch_queue_t t = queues[i];
        NSLog(@"%u - dispatch queue label = %s", i, dispatch_queue_get_label(t));
    }
//    debug住看target的属性
    [self logEnd:(@"Target")];
    
//    [self logBegin:(@"set Target test")];
//    // http://www.jianshu.com/p/c2b14bb999de
//    dispatch_queue_t queue2 = dispatch_queue_create("com.company.queue1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue1 = dispatch_queue_create("com.company.queue2", DISPATCH_QUEUE_SERIAL);
//    
//    dispatch_set_target_queue(queue1, queue2);
//    //
//    dispatch_async(queue1, ^{    // block1
//        for (int i = 0; i < 5; i ++) {
//            NSLog(@"+++++");
//        }
//    });
//    dispatch_async(queue1, ^{ // block2
//        for (int i = 0; i < 5; i ++) {
//            NSLog(@"=====");
//        }
//    });
//    dispatch_async(queue2, ^{    // block3
//        for (int i = 0; i < 5; i ++) {
//            NSLog(@"----");
//        }
//    });
//    
//    [self logEnd:(@"set Target test")];
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
