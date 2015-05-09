//
//  RoomStatus.m
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import "RoomStatus.h"
#import "UserInput.h"

static int roomChangePage = 0;  //在换房的过程中 控制是第几个页面
static NSString* oriRoom;
static NSString* newRoom;

@interface RoomStatus ()
@property (weak, nonatomic) IBOutlet UILabel *lbl_banner;
@property NSString* roomNum;

@end

@implementation RoomStatus

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
    _lbl_banner.text = _option;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(checkedout) name:@"checkedout" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(roomchange) name:@"roomchange" object:nil];
    
    if ([_option isEqualToString:@"check-in"]) {    //加载入住信息
        [self caseCheckin];
    }
    else if([_option isEqualToString:@"check-out"]){    //加载退房信息
        [self caseCheckout];
    }
    else if([_option isEqualToString:@"room-change"]){  //加载换房时的初始界面
        if (roomChangePage == 0) {
            [self caseCheckout];
        }
        else{
            [self caseRoomChange];
        }
    }
    else if([_option isEqualToString:@"room-status"]){
        [self caseCheckout];
    }
    else{
        NSLog(@"error");
    }
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    if ([_option isEqualToString:@"check-in"]) {    //刷新页面
        [self caseCheckin];
    }
    else if([_option isEqualToString:@"check-out"]){
        [self caseCheckout];
    }
    else if([_option isEqualToString:@"room-change"]){
        if (roomChangePage == 0) {
            [self caseCheckout];
        }
        else{
            [self caseRoomChange];
        }
    }
    else{
        NSLog(@"error");
    }
}

-(void)caseCheckin
{
    NSMutableArray* database = [Database database];
    for (int i = 0; i < database.count; i++) {
        
        Customer* tmpC = [database objectAtIndex:i];
        for (int j = 0; j < _btn_rooms.count; j++) {    //在刷新页面时 重新加载入住信息
        
            UIButton* tmpB = [_btn_rooms objectAtIndex:j];
            if ([tmpC.roomNum isEqualToString:tmpB.currentTitle]) {
                tmpB.backgroundColor = [UIColor grayColor];     //有人的房间设置成按钮不可用并且为灰色
                tmpB.userInteractionEnabled = NO;
            }
        }
    }
}



-(void)caseCheckout
{
    NSMutableArray* database = [Database database];
    
    for (int j = 0; j < _btn_rooms.count; j++) {        //退房刷新页面
        
        UIButton* tmpB = [_btn_rooms objectAtIndex:j];  //先整体将按钮全部设置为灰色 和 不可用
        tmpB.backgroundColor = [UIColor grayColor];
        tmpB.userInteractionEnabled = NO;
    }
    
    for (int i = 0; i < database.count; i++) {
        
        Customer* tmpC = [database objectAtIndex:i];
        for (int j = 0; j < _btn_rooms.count; j++) {    //将有人的房间 设置成可用的 绿色
            
            UIButton* tmpB = [_btn_rooms objectAtIndex:j];
            if ([tmpC.roomNum isEqualToString:tmpB.currentTitle]) {
                tmpB.backgroundColor = [UIColor blueColor];
                tmpB.userInteractionEnabled = YES;
            }
        }
    }
}

-(void)caseRoomChange
{
    NSMutableArray* database = [Database database];     //同退房
    
    for (int j = 0; j < _btn_rooms.count; j++) {
        
        UIButton* tmpB = [_btn_rooms objectAtIndex:j];
        tmpB.backgroundColor = [UIColor greenColor];
        tmpB.userInteractionEnabled = YES;
    }
    
    for (int i = 0; i < database.count; i++) {
        
        Customer* tmpC = [database objectAtIndex:i];
        for (int j = 0; j < _btn_rooms.count; j++) {
            
            UIButton* tmpB = [_btn_rooms objectAtIndex:j];
            if ([tmpC.roomNum isEqualToString:tmpB.currentTitle]) {
                tmpB.backgroundColor = [UIColor grayColor];
                tmpB.userInteractionEnabled = NO;
            }
        }
    }
}

- (IBAction)btn_room_click:(id)sender {
    if (roomChangePage == 0) {  //当操作不为换房是 正常入住和退房的操作
        UIButton* button = sender;
        
        UserInput* userInput = [[UserInput alloc]initWithNibName:@"UserInput" bundle:nil];
        
        userInput.option = _option;
        userInput.roomNum = button.currentTitle;
        
        oriRoom = button.currentTitle;
        [self presentViewController:userInput animated:YES completion:nil];
    }else{
        roomChangePage = 0; //将标志位清空
        UIButton* button = sender;
        newRoom = button.currentTitle;
        [self roomHasChanged];  //换房操作的第二界面 为用户更换房间号
        [self dismissViewControllerAnimated:YES completion:nil];    //如果为换房操作时 对第二次按房间号 进行处理
    }

}

-(void)checkedout   //接到退房通知 清空数据
{
    NSMutableArray* database = [Database database];
    
    for (int i = 0; i < database.count; i++) {
        
        Customer* tmpC = [database objectAtIndex:i];
        
        if ([tmpC.roomNum isEqualToString:oriRoom]) {
            [database removeObjectAtIndex:i];
        }
    }
    
}
-(void)roomchange   //接到换房通知 设置标志位
{
    roomChangePage = 1;
}
-(void)roomHasChanged   //用户已经成功换房  查找到用户在数据库中的位置 并且更换房间号
{
    NSMutableArray* database = [Database database];
    
    for (int i = 0; i < database.count; i++) {
        
        Customer* tmpC = [database objectAtIndex:i];
        
        if ([tmpC.roomNum isEqualToString:oriRoom]) {
            tmpC.roomNum = newRoom;
        }
    }
}



- (IBAction)btn_cancel_click:(id)sender {   //如果在换房过程中 取消 恢复标志位
    if (roomChangePage != 0) {
        roomChangePage = 0;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
