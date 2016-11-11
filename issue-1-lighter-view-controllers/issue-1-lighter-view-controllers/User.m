//
//  User.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "User.h"

static NSString * const IdentifierKey = @"identifier";
static NSString * const UsernameKey = @"username";
static NSString * const FirstNameKey = @"firstname";
static NSString * const LastNameKey = @"lastname";
static NSString * const PhotosKey = @"photos";

@implementation User

#pragma NSCoding 

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _identifier = [aDecoder decodeInt64ForKey:IdentifierKey];
        _username = [aDecoder decodeObjectOfClass:[NSString class] forKey:UsernameKey];
        _firstName = [aDecoder decodeObjectOfClass:[NSString class] forKey:FirstNameKey];
        _lastName = [aDecoder decodeObjectOfClass:[NSString class] forKey:LastNameKey];
        _photos = [aDecoder decodeObjectOfClass:[NSArray class] forKey:PhotosKey];
    }
    return self;
}

@end
