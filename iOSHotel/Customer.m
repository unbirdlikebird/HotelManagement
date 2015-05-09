//
//  Customer.m
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (id)initWithName:(NSString*)name andID:(NSString*)ID andEmail:(NSString*)email andRoomNum:(NSString*)roomNum
{
    self = [super init];
    if (self) {
        _name = name;
        _ID = ID;
        _email = email;
        _roomNum = roomNum;
    }
    return self;
}

@end
