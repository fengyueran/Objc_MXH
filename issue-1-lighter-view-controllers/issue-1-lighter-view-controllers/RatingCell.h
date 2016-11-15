//
//  RatingCell.h
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingCell : UITableViewCell

@property (nonatomic) double rating;

+ (UINib *)nib;

@end
