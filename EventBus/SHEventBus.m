//
//  SHEventBus.m
//  EventBusDemo
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SHEventBus.h"

@implementation SHEventBus
{
    NSMutableArray *allReceiverAry;
}

+ (SHEventBus *)shareInstance{
    static dispatch_once_t onceToken;
    static SHEventBus *eventBus;
    dispatch_once(&onceToken, ^{
        eventBus = [[SHEventBus alloc] init];
    });
    return eventBus;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        allReceiverAry = [NSMutableArray array];
    }
    return self;
}

/**
 加入需要对event进行监听的对象
 
 @param receiver 对象
 */
- (void)subscribeEvent:(NSObject *)receiver{
    if ([allReceiverAry containsObject:receiver]) {
        return;
    }
    [allReceiverAry addObject:receiver];
}


/**
 对象取消对event的监听
 
 @param receiver obj
 */
- (void)unSubcribeEvent:(NSObject *)receiver{
    if ([allReceiverAry containsObject:receiver]) {
        [allReceiverAry removeObject:receiver];
    }
}


/**
 将事件发给每个订阅者，实现代理的订阅者获得事件，代理方法名有个前缀区分

 @param receiver obj
 */
- (void)broadcastEventToReceiver:(id)receiver{
    NSString *string = NSStringFromClass([receiver class]);
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"event%@:",string]);
    
    for (NSObject *obj in allReceiverAry) {
        if ([obj respondsToSelector:selector]) {
            [obj performSelector:selector withObject:receiver];
        }
    }
    
}


@end



@implementation SHEvent

- (void)boardcastEvent{
    [[SHEventBus shareInstance] broadcastEventToReceiver:self];
}

@end





