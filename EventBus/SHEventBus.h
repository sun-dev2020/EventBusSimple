//
//  SHEventBus.h
//  EventBusDemo
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHEventBus : NSObject


+ (SHEventBus *)shareInstance;

- (void)subscribeEvent:(NSObject *)receiver;  //对象订阅事件

- (void)unSubcribeEvent:(NSObject *)receiver;  //对象取消订阅

- (void)broadcastEventToReceiver:(id)receiver;      //广播事件

@end


#define DEFINE_NEWEVENT(name, parent) \
@class name; \
@protocol name##Delegate \
- (void) event##name: (name *)event; \
@end \
@interface name : parent

#define DEFINE_NEWEVENT_END \
@end

@interface SHEvent : NSObject        //事件传递的中间对象   

- (void)boardcastEvent;


@end
