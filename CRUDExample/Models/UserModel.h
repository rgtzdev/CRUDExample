//
//  UserModel.h
//  CRUDExample
//
//  Created by Ramiro Gutierrez on 18/10/14.
//  Copyright (c) 2014 Ramiro Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSRESTconnection.h"

@interface UserModel : NSObject
{
    WSRESTconnection * conn;
}

@property NSNumber * userid;
@property NSString * username;
@property NSString * password;
@property NSString * email;
@property NSNumber * permissionid;

-(UserModel *) init;
-(NSArray *) getAll;
-(BOOL) create;
-(BOOL) save;
-(BOOL) update;
-(BOOL) destroy;

@end
