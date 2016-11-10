//
//  ArrayDataSource.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "ArrayDataSource.h"


@interface ArrayDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureBlock;
@end
@implementation ArrayDataSource

- (id) initWithItems:(NSArray *)anItems
      cellIdentifier:(NSString *)aCellIdentifier
  configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureBlock = aConfigureCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}

@end
