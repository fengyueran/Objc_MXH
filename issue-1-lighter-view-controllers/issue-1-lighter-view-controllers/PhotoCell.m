//
//  PhotoCell.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

+ (UINib *)nib {
    //nib是经过Xcode编译之后的，加密的文件
   return [UINib nibWithNibName:@"PhotoCell" bundle:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
