//
//  PhotoCell.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UITableViewCell

+ (UINib *)nib;

@property (weak, nonatomic) IBOutlet UILabel *photoTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *photoDateLabel;

@end
