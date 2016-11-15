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

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.photoTitleLable.shadowColor = [UIColor redColor];
        self.photoTitleLable.shadowOffset =CGSizeMake(3, 3);
    } else {
        self.photoTitleLable.shadowColor = nil;
    }
}

@end
