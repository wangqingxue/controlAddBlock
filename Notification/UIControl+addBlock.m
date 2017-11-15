//
//  UIControl+addBlock.m
//  Notification
//
//  Created by qingxue on 17/11/16.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "UIControl+addBlock.h"

@interface UIControlAddBlockTarget : NSObject

@property (nonatomic, assign) UIControlEvents event;

@property (nonatomic, copy) void (^block)(id sender);

- (void)invoke:(id)sender;

- (void)initWithEvents:(UIControlEvents)event andBlock:(void (^)(id sender))block;

@end

@implementation UIControlAddBlockTarget

- (void)invoke:(id)sender{
    if (_block) _block(sender);
}

- (id)initWithEvent:(UIControlEvents)event andBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
        _event = event;
    }
    return self;
}




@end

@implementation UIControl (addBlock)

@end
