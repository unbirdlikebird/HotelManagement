//
//  RoomStatus.h
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Customer.h"

@interface RoomStatus : UIViewController
@property NSString* option;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btn_rooms;

@end
