//
//  Customer.h
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property NSString* name;
@property NSString* ID;
@property NSString* email;
@property NSString* roomNum;

- (id)initWithName:(NSString*)name andID:(NSString*)ID andEmail:(NSString*)email andRoomNum:(NSString*)roomNum;

@end
