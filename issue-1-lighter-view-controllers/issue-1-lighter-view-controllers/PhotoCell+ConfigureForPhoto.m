//
//  PhotoCell+ConfigureForPhoto.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "PhotoCell+ConfigureForPhoto.h"
#import "Photo.h"

@implementation PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo {
    self.photoTitleLable.text = photo.name;
    self.photoDateLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}
@end
