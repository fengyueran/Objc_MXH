//
//  PhotoViewController.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "PhotoViewController.h"
#import "DetailsViewController.h"
#import "DetailViewController.h"
#import "Photo.h"
#import "User.h"

@interface PhotoViewController ()<DetailsViewControllerDelegate>

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateForPhoto];
    [self addPhotoDetailsTableView];
}

- (void)updateForPhoto {
    self.navigationItem.title = self.photo.name;
    self.authorLabel.text = self.photo.authorFullName;
    self.photoTabkenLabel.text = [NSString stringWithFormat:@"%lu", self.photo.user.numberOfPhotosTaken];
}

- (void)addPhotoDetailsTableView {
    DetailsViewController *details = [[DetailsViewController alloc] init];
    details.photo = self.photo;
    details.delegate = self;
/*  在调用[父视图控制器 addChildViewController:子视图控制器]之后，要仅接着调用[子视图控制器 didMoveToParentViewController:父视图控制器]方法。
    details为UIViewTableViewController,由当前的ViewController来管理
 */
    [self addChildViewController:details];
    CGRect frame = self.view.bounds;
    frame.origin.y = 110;
    details.tableView.frame = frame;
    details.view.frame = frame;
    details.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:details.view];
    [details didMoveToParentViewController:self];
}

#pragma mark OBJPhotoDetailsViewControllerDelegate
//该代理方法实现controller间的通信
- (void)didSelectPhotoAttributeWithKey:(NSString *)key {
    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    detailViewController.key = key;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
