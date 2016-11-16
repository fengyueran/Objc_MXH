//
//  Store.m
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "Store.h"
#import "Item+CoreDataProperties.h"

@implementation Store

- (Item *)rootItem {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", nil];
    NSArray *objects = [self.managedObjectContext executeFetchRequest:request error:nil];
    Item *rootItem = [objects lastObject];
    if (rootItem == nil) {
        rootItem = [Item insertItemWithTitle:nil parent:nil inManagedObjectContext:self.managedObjectContext];
    }
    return  rootItem;
}

@end
