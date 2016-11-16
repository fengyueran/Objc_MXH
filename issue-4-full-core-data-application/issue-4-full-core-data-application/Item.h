//
//  Item.h
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
//relationship 表示当前实体和其他实体的关系
@interface Item : NSManagedObject
+ (instancetype)insertItemWithTitle:(NSString *)title
                             parent:(Item *)parent
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
- (NSFetchedResultsController *)childrenFetchedResultsController;


@end

NS_ASSUME_NONNULL_END

#import "Item+CoreDataProperties.h"
