//
//  UserModel.h
//  EventBusDemo
//
//  Created by mac on 2017/2/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic ,assign) BOOL boy;
@property (nonatomic ,assign) int userId;
@property (nonatomic ,copy) NSString *name;
@property(nonatomic ,copy) NSString *city;


@end
