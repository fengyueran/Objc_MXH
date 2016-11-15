//
//  Store.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <Foundation/Foundation.h>


//Store 对象会关心数据加载、缓存和设置数据栈。它也经常被称为服务层或者仓库。
@interface Store : NSObject

+ (instancetype)store;
- (NSArray *)sortedPhotos;

@property (nonatomic, strong, readonly) NSArray *users;
@property (nonatomic, strong, readonly) NSArray *photos;
@end
