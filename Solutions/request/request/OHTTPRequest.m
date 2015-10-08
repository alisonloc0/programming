//
//  OHTTPRequest.m
//  request
//
//  Created by user on 28/08/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import "OHTTPRequest.h"

@implementation OHTTPRequest
{
    NSMutableData * httpResponse;


}
@synthesize delegate;
@synthesize functionID;


- ( void ) makeHttpRequest:(NSString *) url withParameters:(NSString *) parameters withAgent:(NSString *) userAgent
{
    httpResponse = [[NSMutableData data] retain];
    
    NSURL * requestUrl = [ NSURL URLWithString:url ] ;


    
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:requestUrl];

    [postRequest setValue:userAgent forHTTPHeaderField: @"User-Agent"];
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [postRequest setHTTPMethod:@"POST"];
    
    if(parameters != nil)
    {
    NSString * bodyParameters = parameters;
    [postRequest setHTTPBody:[NSData dataWithBytes:[bodyParameters UTF8String] length:[bodyParameters length]]];
    }
    
    [postRequest setTimeoutInterval:60.0];


    [NSURLConnection connectionWithRequest:postRequest delegate:self];
    
    
}

#pragma mark NSURLConnection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [ httpResponse setLength:0];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(delegate)
    {
    
        [ httpResponse appendData:data];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if(delegate)
    {
    
        [delegate requestERROR:error];
    
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * ret = [[NSString alloc] initWithData:httpResponse encoding:NSUTF8StringEncoding];
    [delegate requestOK:ret withFunctionId:[self functionID]];

}


@end
