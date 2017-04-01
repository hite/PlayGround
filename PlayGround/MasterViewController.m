//
//  MasterViewController.m
//  PlayGround
//
//  Created by liang on 28/03/2017.
//  Copyright © 2017 liang. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ThreadDemoViewController.h"
#import "Demo_A1_AboutLogViewController.h"
#import "Demo_A2_SyncViewController.h"
#import "Demo_A3_QueueTypeViewController.h"
#import "Demo_A4_TargetViewController.h"
#import "Demo_A5_SourceViewController.h"

@implementation DemoMapper

@end

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    [self initData];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    // log测试
    DemoMapper *thread = [DemoMapper new];
    thread.demoName = @"NSLog和printf的关系";
    thread.clzName = Demo_A1_AboutLogViewController.class;
    
    [self.objects addObject:thread];
    // 同步异步测试
    DemoMapper *a2 = [DemoMapper new];
    a2.demoName = @"Sync VS. Async 比较";
    a2.clzName = Demo_A2_SyncViewController.class;
    [self.objects addObject:a2];
    // 队列分类
    DemoMapper *a3 = [DemoMapper new];
    a3.demoName = @"全局队列的分类";
    a3.clzName = Demo_A3_QueueTypeViewController.class;
    [self.objects addObject:a3];
    
    // target
    DemoMapper *a4 = [DemoMapper new];
    a4.demoName = @"Target测试";
    a4.clzName = Demo_A4_TargetViewController.class;
    [self.objects addObject:a4];
    
    // source 测试
    DemoMapper *a5 = [DemoMapper new];
    a5.demoName = @"dispatch source 测试";
    a5.clzName = Demo_A5_SourceViewController.class;
    [self.objects addObject:a5];
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    DemoMapper *object = self.objects[indexPath.row];
    cell.textLabel.text = object.demoName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoMapper *object = self.objects[indexPath.row];
    UIViewController *cls = (UIViewController *)[object.clzName new];;
    [self.navigationController pushViewController:cls animated:YES];
}


@end
