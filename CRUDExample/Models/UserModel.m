//
//  UserModel.m
//  CRUDExample
//
//  Created by Ramiro Gutierrez on 18/10/14.
//  Copyright (c) 2014 Ramiro Gutierrez. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(UserModel *)init{

    self = [super init];
    conn = [[WSRESTconnection alloc] init];
    return self;

}//End of init method

/***
 * getAll
 * Method that returns all users from the server
 * @params none
 * @return NSArray *
 *******************/
-(NSArray *) getAll{
    
    NSMutableArray * users = [[NSMutableArray alloc] init];
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@User", conn.restURL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error;
    NSURLResponse * response;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    if( data.length > 0 && error == nil ){
        
        NSError *jsonError = nil;
        
        id array =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];

        if( [array isKindOfClass:[NSDictionary class]] && error == nil ){
            
            for ( NSDictionary *jsonUser in array[@"userDTO"] ) {
            
                UserModel * tempUser = [[UserModel alloc]init];
                
                tempUser.userid = jsonUser[@"userid"];
                tempUser.username = jsonUser[@"username"];
                tempUser.password = jsonUser[@"password"];
                tempUser.permissionid = jsonUser[@"permissionid"];
            
                [users addObject:tempUser];
            
            }
            
        }
        
    }
    
    return [[NSArray alloc] initWithArray:users];
    
}//End of getAll Method

-(BOOL) create{
    
    return YES;
    
}//End of create Method

-(BOOL) save{

    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@User", conn.restURL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSError *error;
    NSURLResponse * response;
    
    [request setHTTPMethod:@"POST"];
    NSString * postString = [NSString stringWithFormat:@"username=%@&password=%@", self.username, self.password];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if( [data isEqual:@"true"] ){
        return YES;
    }
    return NO;
    
}//End of save method

-(BOOL) update{

    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@User", conn.restURL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSError *error;
    NSURLResponse * response;
    
    [request setHTTPMethod:@"PUT"];
    NSString * postString = [NSString stringWithFormat:@"userid=%@&username=%@&password=%@", self.userid, self.username, self.password];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if( [data isEqual:@"true"] ){
        return YES;
    }
    return NO;
    
    return YES;
    
}//End of update Method

-(BOOL) destroy{

    return YES;
    
}//End of destroy Method

@end
