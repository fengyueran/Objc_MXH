//
//  ItemViewController.m
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "ItemViewController.h"
#import "FetchedResultsControllerDataSource.h"
#import "Item.h"

@interface ItemViewController ()<FetchedResultsControllerDataSourceDelegate>

@property (nonatomic, strong) FetchedResultsControllerDataSource *fetchedResultsControllerDataSource;

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFetchedResultsController];
    

}

- (void)setupFetchedResultsController {
    self.fetchedResultsControllerDataSource = [[FetchedResultsControllerDataSource alloc]initWithTableView:self.tableView];
    self.fetchedResultsControllerDataSource.fetchedResultsController = self.parent.childrenFetchedResultsController;
    self.fetchedResultsControllerDataSource.delegate = self;
    self.fetchedResultsControllerDataSource.reuseIdentifier = @"Cell";
}

#pragma mark FetchedResultsControllerDataSourceDelegate

- (void)configureCell:(id)theCell withObject:(id)object {
    UITableViewCell *cell = theCell;
    Item *item = object;
    cell.textLabel.text = item.title;
}

- (void)deleteObject:(id)object {
    Item *item = object;
        NSString* actionName = [NSString stringWithFormat:NSLocalizedString(@"Delete \"%@\"", @"Delete undo action name"), item.title];
    [self.undoManager setActionName:actionName];
    [item.managedObjectContext deleteObject:item];
}

- (void)setParent:(Item *)parent {
    _parent = parent;
    self.navigationItem.title = parent.title;
}
@end
