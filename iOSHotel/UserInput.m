//
//  UserInput.m
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import "UserInput.h"

@interface UserInput ()

@property (weak, nonatomic) IBOutlet UITextField *tf_name;
@property (weak, nonatomic) IBOutlet UITextField *tf_ID;
@property (weak, nonatomic) IBOutlet UITextField *tf_email;

@end

@implementation UserInput

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
    
    _lbl_roomNum.text = _roomNum;
    _lbl_banner.text = _option;
    
    if([_option isEqualToString:@"check-out"]){
        [self caseCheckout];
    }
    else if([_option isEqualToString:@"room-change"]){
        [self caseCheckout];
    }
    else if([_option isEqualToString:@"room-status"]){
        [self caseCheckout];
    }
    else{
        NSLog(@"error");
    }
    
    // Do any additional setup after loading the view from its nib.
}

-(void)caseCheckout
{
    NSMutableArray* database = [Database database];
    
    for (int i = 0 ; i < database.count; i++) {
        Customer* tmpC = [database objectAtIndex:i];
        if ([tmpC.roomNum isEqualToString:_roomNum]) {
            _tf_name.text = tmpC.name;
            _tf_ID.text = tmpC.ID;
            _tf_email.text = tmpC.email;
            break;
        }
    }
}


- (IBAction)btn_active_click:(id)sender {
    
    if ([_option isEqualToString:@"check-in"]) {
        [self Checkin];
    }
    else if([_option isEqualToString:@"check-out"]){
        [self Checkout];
    }
    else if([_option isEqualToString:@"room-change"]){

        [self RoomChange];
    }
    else if([_option isEqualToString:@"room-status"]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        NSLog(@"error");
    }
}
-(void)Checkin
{
    if ([_tf_name.text length] > 0 && [_tf_ID.text length] > 0 && [_tf_email.text length] > 0) {
        Customer* cstmr = [[Customer alloc]initWithName:_tf_name.text andID:_tf_ID.text andEmail:_tf_email.text andRoomNum:_roomNum];
        [Database upload2Database:cstmr];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)Checkout
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkedout" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)RoomChange
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"roomchange" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_cancel_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
