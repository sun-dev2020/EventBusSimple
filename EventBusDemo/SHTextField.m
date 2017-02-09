//
//  SHTextField.m
//  EventBusDemo
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SHTextField.h"
//@class SHTextFieldEvent;

@interface SHTextFieldEvent ()

- (instancetype)initWithSender:(id)obj;
@end

@implementation SHTextFieldEvent

- (instancetype)initWithSender:(id)obj{
    self = [super init];
    if (self) {
        _sender = obj;
    }
    return self;
}

@end


@implementation SHTextField

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)textChange:(SHTextField *)textField{
    [[[SHTextFieldEvent alloc] initWithSender:textField] boardcastEvent];
}

@end
