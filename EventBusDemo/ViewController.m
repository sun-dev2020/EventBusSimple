//
//  ViewController.m
//  EventBusDemo
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "SHEventBus.h"
#import "SHTextField.h"
#import "SHButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SHTextField *textField = [[SHTextField alloc] initWithFrame:CGRectMake(100, 60.0f, 200, 40.0f)];
    textField.placeholder = @"输入内容";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    SHButton *button = [[SHButton alloc] initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y + textField.frame.size.height + 50.f, textField.frame.size.width, 40)];
    [self.view addSubview:button];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginBtn:(id)sender {
}
@end
