//
//  Store.h
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

@class Item;
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Store : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (Item *)rootItem;

@end
