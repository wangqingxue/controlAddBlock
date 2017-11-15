//
//  SingleObject.m
//  Notification
//
//  Created by qingxue on 17/11/16.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "SingleObject.h"

@implementation SingleObject

+ (instancetype)shareSingleObject{
    static SingleObject *sigle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sigle = [[SingleObject alloc]init];
    });
    return sigle;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray){
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

@end
