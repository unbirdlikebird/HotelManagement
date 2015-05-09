//
//  Database.m
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import "Database.h"

static NSMutableArray* database;

@implementation Database

- (id)init
{
    self = [super init];
    if (self) {
        database = [[NSMutableArray alloc]initWithCapacity:25];
    }
    return self;
}

+(NSMutableArray*)database
{
    return database;
}

+(void)upload2Database:(Customer*)customer
{
    [database addObject:customer];
}

@end
