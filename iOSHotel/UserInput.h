//
//  UserInput.h
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Customer.h"

@interface UserInput : UIViewController
@property NSString* roomNum;
@property NSString* option;
@property (weak, nonatomic) IBOutlet UILabel *lbl_roomNum;
@property (weak, nonatomic) IBOutlet UILabel *lbl_banner;

@end
