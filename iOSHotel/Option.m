//
//  Option.m
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import "Option.h"

@interface Option ()

@end

@implementation Option

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn_checkin_click:(id)sender {
    RoomStatus* rs = [[RoomStatus alloc]initWithNibName:@"RoomStatus" bundle:nil];
    rs.option = @"check-in";
    [self presentViewController:rs animated:YES completion:nil];
}
- (IBAction)btn_checkout_click:(id)sender {
    RoomStatus* rs = [[RoomStatus alloc]initWithNibName:@"RoomStatus" bundle:nil];
    rs.option = @"check-out";
    [self presentViewController:rs animated:YES completion:nil];
}
- (IBAction)btn_roomchange_click:(id)sender {
    RoomStatus* rs = [[RoomStatus alloc]initWithNibName:@"RoomStatus" bundle:nil];
    rs.option = @"room-change";
    [self presentViewController:rs animated:YES completion:nil];
}
- (IBAction)btn_roomstatus_click:(id)sender {
    RoomStatus* rs = [[RoomStatus alloc]initWithNibName:@"RoomStatus" bundle:nil];
    rs.option = @"room-status";
    [self presentViewController:rs animated:YES completion:nil];
}
- (IBAction)btn_exit_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
