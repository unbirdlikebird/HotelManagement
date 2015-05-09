//
//  Database.h
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface Database : NSObject

+(NSMutableArray*)database;
+(void)upload2Database:(Customer*)customer;

@end
