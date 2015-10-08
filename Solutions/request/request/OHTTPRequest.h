//
//  OHTTPRequest.h
//  request
//
//  Created by user on 28/08/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OHTTPRequestDelegate.h"

@interface OHTTPRequest : NSObject <NSURLConnectionDataDelegate>
{
    
    id<OHTTPRequestDelegate> delegate;
    int functionID;

}

@property ( retain) id delegate;
@property ( nonatomic ) int functionID;

- ( void ) makeHttpRequest:(NSString *) url withParameters:(NSString *) parameters withAgent:(NSString *) userAgent;

@end
