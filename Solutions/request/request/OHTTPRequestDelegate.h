//
//  OHTTPRequestDelegate.h
//  request
//
//  Created by user on 28/08/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OHTTPRequestDelegate <NSObject>
@required

-(void) requestOK:(NSString *) data withFunctionId:(int) functionID;
-(void) requestERROR:(NSError *) error;

@end
