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
            
            IMP imp = [obj methodForSelector:selector];     // 查找对应的selector，得到函数指针
            void (*function)(id ,SEL ,id) = (void *)imp;        // 转换函数指针（id ,SEL ,...）第一个id是消息的接受者，第二个是函数 第三个是传递的参数
            function(obj, selector,receiver);
            
//            [obj performSelector:selector withObject:receiver];     //这样些编译器会因为无法检查是否存在这个selector报警告
        }
    }
    
}


@end



@implementation SHEvent

- (void)boardcastEvent{
    [[SHEventBus shareInstance] broadcastEventToReceiver:self];
}

@end





