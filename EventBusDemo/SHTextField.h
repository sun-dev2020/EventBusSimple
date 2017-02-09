//
//  SHTextField.h
//  EventBusDemo
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHEventBus.h"

@interface SHTextField : UITextField

@end


DEFINE_NEWEVENT(SHTextFieldEvent, SHEvent)      //自定义事件传播的中间对象

@property (nonatomic ,strong) SHTextField *sender;


DEFINE_NEWEVENT_END
