//
//  Item+CoreDataProperties.h
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *order;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<Item *> *children;
@property (nullable, nonatomic, retain) Item *parent;




@end

@interface Item (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Item *)value;
- (void)removeChildrenObject:(Item *)value;
- (void)addChildren:(NSSet<Item *> *)values;
- (void)removeChildren:(NSSet<Item *> *)values;

@end

NS_ASSUME_NONNULL_END
