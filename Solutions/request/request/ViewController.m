//
//  ViewController.m
//  request
//
//  Created by user on 28/08/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import "ViewController.h"
#import "OHTTPRequest.h"


@interface ViewController ()
{

    NSString * APP_ID ;
    NSString * APP_SECRET;
    NSString * AGENT_NAME;

    NSString * USER_AGENT;
    
    NSString * IP_ADRESS;
    NSString * URL_APPLICATION;
    NSString * URL_SEED;
    
    UIActivityIndicatorView * indicator;

}
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    IP_ADRESS = @"http://192.168.0.102";
    URL_APPLICATION = @"/pagina.php";
    URL_SEED = @"/seed.php";
    
    USER_AGENT = @"Android";

    APP_ID = @"2";
    APP_SECRET = @"4321";
    AGENT_NAME = @"Android";
    
    [self initProgress];
    [self authApp];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUserAgent:(NSString *) seed {

        [self messageConsole:@"  "];
        [self messageConsole:@" ----- Changing user_agent ----- "];
        [self messageConsole:@"  "];
        [self messageConsole:@">>> SWAP USER_AGENT HTTP"];

        // global var is set and will be use HTTP header
        USER_AGENT = [NSString stringWithFormat:@"%@_%@",AGENT_NAME,seed];
        [self messageConsole:[NSString stringWithFormat:@">>> NEW USER_AGENT : %@",USER_AGENT]];
    
}

- (void) messageConsole:(NSString * )message {
    
    NSLog(@"%@",message);
    
}

// called when app is init
-(void) initProgress
{
    
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    
}
-(void) messageProgress
{
    
    
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];

    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [indicator startAnimating];
    

}

-(void)messageDismiss
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    [indicator stopAnimating];
    [indicator removeFromSuperview];
}

// FUNCTION ID - 1
-(void) getNewSeed
{
        [self messageProgress];
    
        [self messageConsole:@"  "];
        [self messageConsole:@" ----- Getting new seed ----- "];
        [self messageConsole:@"  "];
        [self messageConsole:@"**** BACKGROUND REQUEST WAS START ( NEW SEED ) ****  "];

        [self messageConsole:@">>> TO TRY NEW SEED   "];
        [self messageConsole:[NSString stringWithFormat:@">>> USER_AGENT : %@",USER_AGENT]];
    
    
        OHTTPRequest * request = [OHTTPRequest alloc];
        [request setDelegate:self];
        [request setFunctionID:1];
    
        [request makeHttpRequest:[NSString stringWithFormat:@"%@%@",IP_ADRESS,URL_SEED]withParameters:nil withAgent:USER_AGENT];
    

    
    

}

-(void)responseGetNewSeed:(NSString *) data
{
    
    [self messageConsole:[NSString stringWithFormat:@"HTTP SEED RESPONSE : %@", data]];
    [self messageConsole:@"**** END BACKGROUND REQUEST ( SEED ) **** "];
    [self setUserAgent:data];


    
}


// FUNCTION ID - 2
-( void) authApp
{
    [self messageProgress];
    
    [self messageConsole:@"  "];
    [self messageConsole:@"  ----- Validating application ----- "];
    [self messageConsole:@"  "];
    [self messageConsole:@"**** BACKGROUND REQUEST WAS START ( APPLICATION ) **** "];
    
    
    OHTTPRequest * request = [OHTTPRequest alloc];
    [request setDelegate:self];
    [request setFunctionID:2];
    
    NSString * parameters = [[ NSString alloc] initWithFormat:@"APP_ID=%@&APP_SECRET=%@",APP_ID,APP_SECRET];
    
    [request makeHttpRequest:[NSString stringWithFormat:@"%@%@",IP_ADRESS,URL_APPLICATION]withParameters:parameters withAgent:USER_AGENT];
    


}

-(void) responseAuthApp:(NSString *) data
{
    
    [self messageConsole:[NSString stringWithFormat:@"HTTP APPLICATION RESPONSE : %@", data]];
    [self messageConsole:@"**** END BACKGROUND REQUEST ( APPLICATION ) **** "];
    
    [self setUserAgent:data];

    [self getNewSeed];
}



-(void)requestOK:(NSString *)data withFunctionId:(int)functionID
{

    [self messageDismiss];
    
    //response getNewSeed
    if (functionID == 1 ) {

        [self responseGetNewSeed:data];

    }
    
    //response authApp
    if (functionID == 2 ) {

        [self responseAuthApp:data];

            
    }
    


}

-(void)requestERROR:(NSError *)error
{
    NSLog(@"Error >> Sorry an error occurred while connecting to the server %@", [error description]);
    [self messageDismiss];
}






@end
