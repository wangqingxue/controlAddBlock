//
//  ViewController.m
//  Notification
//
//  Created by qingxue on 17/11/16.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>
#import "SecondViewController.h"
#import "SingleObject.h"

@interface ViewController ()

@property (nonatomic, weak) SingleObject *singleObject;
@property (nonatomic, strong) RACDisposable *dispose;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"testRacNotification" object:nil] takeUntil:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        return [RACDisposable disposableWithBlock:^{
//            
//        }];
//    }]] subscribeNext:^(id x) {
//        
//    }];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"第一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(defaultClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [self initRAC];
}

- (void)initRAC{
    self.dispose =  [RACObserve(self.singleObject, dataArray) subscribeNext:^(id x) {
        NSLog(@"第一个页面监听到数据变化了嘎嘎嘎嘎");
    }];
}

- (void)defaultClick{
    SecondViewController *secondController = [[SecondViewController alloc]init];
    [self presentViewController:secondController animated:YES completion:^{
        
    }];
}

- (SingleObject *)singleObject{
    if (!_singleObject){
        _singleObject = [SingleObject shareSingleObject];
    }
    return _singleObject;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.dispose dispose];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
