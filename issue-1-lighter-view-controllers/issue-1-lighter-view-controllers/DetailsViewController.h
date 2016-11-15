//
//  DetailsViewController.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;
@protocol DetailsViewControllerDelegate <NSObject>

- (void)didSelectPhotoAttributeWithKey:(NSString *)key;

@end

@interface DetailsViewController : UITableViewController

@property (nonatomic, strong) Photo *photo;
@property (nonatomic, weak) id<DetailsViewControllerDelegate> delegate;
@end
