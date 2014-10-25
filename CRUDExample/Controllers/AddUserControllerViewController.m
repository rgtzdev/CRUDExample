//
//  AddUserControllerViewController.m
//  CRUDExample
//
//  Created by Ramiro Gutierrez on 24/10/14.
//  Copyright (c) 2014 Ramiro Gutierrez. All rights reserved.
//

#import "AddUserControllerViewController.h"
#import "UserModel.h"

@interface AddUserControllerViewController ()

@property UserModel * user;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)addUser:(id)sender;

@end

@implementation AddUserControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [[UserModel alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addUser:(id)sender {
    
    UserModel * u = [[UserModel alloc] init];
    u.userid = @0;
    u.username = [self.txtUsername text];
    u.password = [self.txtPassword text];
    u.permissionid = @2;
    
    [self.delegate didSaveWithUser:self user:u];

}//End of addUser Method

@end
