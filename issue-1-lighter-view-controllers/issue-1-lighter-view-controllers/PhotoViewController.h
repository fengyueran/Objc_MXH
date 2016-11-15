//
//  PhotoViewController.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;


@interface PhotoViewController : UIViewController

@property (nonatomic, strong) Photo *photo;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoTabkenLabel;

@end
