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
        //需要知道，数据，Identifier，cell
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureBlock = aConfigureCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"-----%ld",indexPath.row);
    return self.items[indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    //分离cell,不需要具体知道cell的样子,由cell的分类来设置
    self.configureBlock(cell, item);
    return cell;
}

@end
