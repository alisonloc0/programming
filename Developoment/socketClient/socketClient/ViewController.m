//
//  ViewController.m
//  socketClient
//
//  Created by user on 28/08/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "ViewController.h"

@interface ViewController(){

        NSInputStream  * inputStream;
        NSOutputStream * outputStream;
        CFReadStreamRef readStream;
        CFWriteStreamRef writeStream;
        CLLocationManager * locationManager ;
}

@end


@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self initNetworkCommunication];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initLocation{

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self initLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{

    CLLocation *location = [locations lastObject];

    
    NSString * dataString = [NSString stringWithFormat:@"to:aloc\r\n>%f,%f",location.coordinate.latitude, location.coordinate.longitude];

    NSData *data = [[NSData alloc] initWithData:[dataString dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];

}


- (void)initNetworkCommunication {
    

    
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 8081, &readStream, &writeStream);
    
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    [inputStream open];
    [outputStream open];
    

    
    NSString *response  = [NSString stringWithFormat:@"iam:iphone"];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];

    
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
        
        switch (streamEvent) {
                
            case NSStreamEventOpenCompleted:
                NSLog(@"Stream opened");
                break;
                
            case NSStreamEventHasBytesAvailable:
                
                if (theStream == inputStream) {
                    
                    uint8_t buffer[1024];
                    NSInteger len;
                    
                    while ([inputStream hasBytesAvailable]) {
                        len = [inputStream read:buffer maxLength:sizeof(buffer)];
                        if (len > 0) {
                            
                            NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
                            
                            if (nil != output) {
                                NSLog(@"server said: %@", output);
                            }
                        }
                    }
                }
                break;
                
            case NSStreamEventErrorOccurred:
                NSLog(@"Can not connect to the host!");
                break;
                
            case NSStreamEventEndEncountered:
                break;
                
            default:
                NSLog(@"Unknown event");
        }
        
}


@end
