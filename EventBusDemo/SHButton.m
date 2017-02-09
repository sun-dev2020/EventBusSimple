//
//  SHButton.m
//  EventBusDemo
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SHButton.h"
#import "SHEventBus.h"
#import "SHTextField.h"

@interface SHButton () <SHTextFieldEventDelegate>

@end

@implementation SHButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [[SHEventBus shareInstance] subscribeEvent:self];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)eventSHTextFieldEvent:(SHTextFieldEvent *)event{
    
    NSLog(@" textfield changed : %@ ",event.sender.text);
    
    [self setTitle:event.sender.text forState:UIControlStateNormal];
}

@end
