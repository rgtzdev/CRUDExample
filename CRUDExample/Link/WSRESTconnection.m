
//
//  WSRESTconnection.m
//  CRUDExample
//
//  Created by Ramiro Gutierrez on 18/10/14.
//  Copyright (c) 2014 Ramiro Gutierrez. All rights reserved.
//

#import "WSRESTconnection.h"

@implementation WSRESTconnection

/***
 * init
 * Method constructor
 ************************/
-(WSRESTconnection *) init{

    self = [super init];
    
    self.restURL = [self getServerURL];
    
    return self;
    
}//End of inti method

-(NSString *) getServerURL{

    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"txtUrlPreferences"];
    
}//End of getServerURL Method

@end
