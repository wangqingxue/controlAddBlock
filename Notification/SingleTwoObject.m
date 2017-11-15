//
//  SingleTwoObject.m
//  Notification
//
//  Created by qingxue on 17/11/16.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "SingleTwoObject.h"
#import "SingleObject.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>

@interface SingleTwoObject ()

@property (nonatomic, strong)SingleObject *singleOne;

@end

@implementation SingleTwoObject

+ (instancetype)shareTowSingle{
    static SingleTwoObject *singleTwo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleTwo = [[SingleTwoObject alloc]init];
    });
    return singleTwo;
}

- (void)initSingle{
    self.singleOne = [SingleObject shareSingleObject];
    [RACObserve(self.singleOne, dataArray) subscribeNext:^(id x) {
        NSLog(@"监听到了第一个变化");
    }];
}

@end
