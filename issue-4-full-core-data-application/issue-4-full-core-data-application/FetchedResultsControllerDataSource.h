//
//  FetchedResultsControllerDataSource.h
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

//该协议为了构建具体的cell,也可以用block
@protocol FetchedResultsControllerDataSourceDelegate <NSObject>

- (void)configureCell:(id)cell withObject:(id)object;
- (void)deleteObject:(id)object;

@end

@interface FetchedResultsControllerDataSource : NSObject<UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) id<FetchedResultsControllerDataSourceDelegate>delegate;
@property (nonatomic, copy) NSString *reuseIdentifier;
@property (nonatomic) BOOL paused;

- (id)initWithTableView:(UITableView *)tableView;
@end
