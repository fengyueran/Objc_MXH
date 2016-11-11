//
//  Photo.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/10/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "Photo.h"
#import "User.h"

static NSString * const IdentifierKey = @"identifier";
static NSString * const NameKey = @"name";
static NSString * const CreationDateKey = @"creationDate";
static NSString * const RatingKey = @"rating";
static NSString * const UserKey = @"user";

@implementation Photo

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _identifier = [aDecoder decodeInt64ForKey:IdentifierKey];
        _name = [aDecoder decodeObjectOfClass:[NSString class] forKey:NameKey];
        _creationDate = [aDecoder decodeObjectOfClass:[NSDate class] forKey:CreationDateKey];
        _rating = [aDecoder decodeDoubleForKey:RatingKey];
        _user = [aDecoder decodeObjectOfClass:[User class] forKey:UserKey];
    }
    return self;
}

@end
