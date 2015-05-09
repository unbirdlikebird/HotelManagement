//
//  Login.m
//  iOSHotel
//
//  Created by KVC on 15-4-27.
//  Copyright (c) 2015年 KVC. All rights reserved.
//

#import "Login.h"

@interface Login ()
@property (weak, nonatomic) IBOutlet UITextField *tf_code;
@property (weak, nonatomic) IBOutlet UITextField *tf_passwd;
@property (weak, nonatomic) IBOutlet UITextField *tf_usrname;
@property (weak, nonatomic) IBOutlet UIButton *btn_code;

@end

@implementation Login

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
    
    NSString* tmp = [self randomCode];
    [_btn_code setTitle:tmp forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btn_comfirm_click:(id)sender {
//    if ([_tf_usrname.text isEqualToString:@"a"] &&
//        [_tf_passwd.text isEqualToString:@"a"] &&
//        [_tf_code.text isEqualToString:_btn_code.currentTitle]){
//        
        Option* option = [[Option alloc]initWithNibName:@"Option" bundle:nil];
        [self presentViewController:option animated:YES completion:nil];
//    }
//    else{
//        _tf_usrname.text = @"wrong username";
//        _tf_passwd.text = @"wrong password";
//    }

}
- (IBAction)btn_cancel_click:(id)sender {
}
- (IBAction)btn_code_click:(id)sender {
    NSString* tmp = [self randomCode];
    [_btn_code setTitle:tmp forState:UIControlStateNormal];
}

- (NSString*)randomCode
{
    NSString* tmp = [NSString stringWithFormat:@"%d", arc4random() % 8999 +1000];
    return tmp;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
