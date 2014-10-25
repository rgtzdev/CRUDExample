//
//  WSRESTconnection.h
//  CRUDExample
//
//  Created by Ramiro Gutierrez on 18/10/14.
//  Copyright (c) 2014 Ramiro Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSRESTconnection : NSObject

@property NSString * restURL;

-(WSRESTconnection *) init;
-(NSString *) getServerURL;

@end
