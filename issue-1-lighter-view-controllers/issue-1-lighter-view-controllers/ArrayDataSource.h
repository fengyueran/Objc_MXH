//
//  ArrayDataSource.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
/*  ArrayDataSource类用来代替UITableView的UITableViewDataSource，
    实现UITableViewDataSource的协议方法，从而使controller不用实现UITableViewDataSource
    协议方法,轻量化controller.
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellConfigureBlock)(id cell, id item);

@interface ArrayDataSource : NSObject<UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
