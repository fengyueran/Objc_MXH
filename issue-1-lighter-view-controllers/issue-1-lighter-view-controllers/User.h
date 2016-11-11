//
//  User.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

//int64_t 保证平台通用性
@property (nonatomic) int64_t identifier;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSArray *photos;

@end
