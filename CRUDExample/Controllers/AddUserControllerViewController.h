//
//  AddUserControllerViewController.h
//  CRUDExample
//
//  Created by Ramiro Gutierrez on 24/10/14.
//  Copyright (c) 2014 Ramiro Gutierrez. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
@class AddUserControllerViewController;

@protocol AddUserDelegate <NSObject>

-(void) didSaveWithUser:(AddUserControllerViewController *) controller user:(UserModel *) user;

@end

@interface AddUserControllerViewController : ViewController <AddUserDelegate>

@property (nonatomic, weak) id<AddUserDelegate> delegate;

@end
