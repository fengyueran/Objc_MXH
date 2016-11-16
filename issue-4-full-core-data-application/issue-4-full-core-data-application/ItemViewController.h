//
//  ItemViewController.h
//  issue-4-full-core-data-application
//
//  Created by intern08 on 11/15/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@interface ItemViewController : UITableViewController

@property (nonatomic, strong) Item *parent;

@end
