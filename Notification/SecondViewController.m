//
//  SecondViewController.m
//  Notification
//
//  Created by qingxue on 17/11/16.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "SecondViewController.h"
#import "SingleObject.h"
#import "SingleTwoObject.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>

@interface SecondViewController ()

@property (nonatomic, strong) SingleObject *singleObject;
@property (nonatomic, strong) SingleTwoObject *singleTwoObject;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"第二页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(defaultClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [self.singleTwoObject initSingle];
    [RACObserve(self.singleObject, dataArray) subscribeNext:^(id x) {
        NSLog(@"单例1发生了变化");
    }];
}

- (void)defaultClick{
    self.singleObject.dataArray = nil;
}

- (SingleObject *)singleObject{
    if (!_singleObject){
        _singleObject = [SingleObject shareSingleObject];
    }
    return _singleObject;
}

- (SingleTwoObject *)singleTwoObject{
    if (!_singleTwoObject){
        _singleTwoObject = [SingleTwoObject shareTowSingle];
    }
    return _singleTwoObject;
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
