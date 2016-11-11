//
//  Store.m
//  issue-1-lighter-view-controllers
//
//  Created by intern08 on 11/11/16.
//  Copyright © 2016 snow. All rights reserved.
//

#import "Store.h"
#import "Photo.h"

@implementation Store

+ (instancetype)store {
    //类也是对象，对象也是对象，他们都有self。类的self就是类，对象的self就是对象。
    //在实例方法中,self就是实例,在类方法中，self就是类。
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        [self readArchive];
    }
    return self;
}

- (void)readArchive {
    //根据当前类来确定bundle当前类在mainBundle
    NSURL *archiveURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"photodata" withExtension:@"bin"];
    //满足条件返回真值，程序继续运行
    NSAssert(archiveURL != nil, @"Unable to find archive in bundle.");
    NSData *data = [NSData dataWithContentsOfURL:archiveURL options:0 error:NULL];
    //NSKeyedUnarchiver:从二进制流读取对象。NSKeyedArchiver:把对象写到二进制流中去。
    //NSCoder 是一个抽象类，抽象类不能被实例话，只能提供一些想让子类继承的方法。NSKeyedUnarchiver : NSCoder 
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    //根据Key值寻找相关类的decode或encode方法
    _users = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
    _photos = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
    [unarchiver finishDecoding];
}

- (NSArray *)sortedPhotos {
   return [self.photos sortedArrayUsingComparator:^NSComparisonResult(Photo *photo1, Photo *photo2) {
       return [photo2.creationDate compare:photo1.creationDate];
    }];
}

@end
