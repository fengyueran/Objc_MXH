//
//  PhotosViewController.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "PhotosViewController.h"
#import "ArrayDataSource.h"
#import "PhotoCell.h"
#import "Photo.h"
#import "PhotoCell+ConfigureForPhoto.h"
#import "AppDelegate.h"
#import "Store.h"
#import "PhotoViewController.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";
@interface PhotosViewController ()<UITableViewDelegate>
@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
}

- (void)setupTableView {
    //configureCell用来在self.tableView.dataSource中设置具体的cell
    TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo) {
        [cell configureForPhoto:photo];
    };
    
    //Store类来获取数据
    NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
    
    //要实现UITableViewDataSource协议方法，必须有相关的数据，这里为photos数组。
    self.photosArrayDataSource = [[ArrayDataSource alloc]initWithItems:photos
                                                        cellIdentifier:PhotoCellIdentifier configureCellBlock:configureCell];
/*
    为了轻量化ViewController,把self.tableView的代理由self改成其他类。
    self.tableView.dataSource=self => self.tableView.dataSource=self.photosArrayDataSource
    在self.photosArrayDataSource中实现UITableViewDataSource协议
*/
    self.tableView.dataSource = self.photosArrayDataSource;
    [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:PhotoCellIdentifier];
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoViewController *photoViewController = [[PhotoViewController alloc]
                                                initWithNibName:@"PhotoViewController" bundle:nil];
    photoViewController.photo = [self.photosArrayDataSource itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:photoViewController animated:YES];
    
}

@end
