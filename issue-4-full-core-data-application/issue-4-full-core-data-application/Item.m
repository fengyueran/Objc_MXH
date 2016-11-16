//
//  Item.m
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "Item.h"

@implementation Item


+ (instancetype)insertItemWithTitle:(NSString *)title
                             parent:(Item *)parent
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSUInteger order = parent.numberOfChildren;
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:managedObjectContext];
    item.title = title;
    item.parent = parent;
    item.order = @(order);
    return item;
}

- (NSFetchedResultsController *)childrenFetchedResultsController {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", self];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"order" ascending:YES]];
    return [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
}

//+ (NSString *)entityName {
//    return @"Item";
//}

- (NSUInteger)numberOfChildren {
    return self.children.count;
}


@end
