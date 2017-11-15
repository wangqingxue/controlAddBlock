//
//  SingleObject.h
//  Notification
//
//  Created by qingxue on 17/11/16.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleObject : NSObject

@property (nonatomic, strong) NSMutableArray *dataArray;

+ (instancetype)shareSingleObject;

@end
