//
//  imageViewController.m
//  master2
//
//  Created by user on 27/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//


#import "imageViewController.h"

@interface imageViewController ()

@end

@implementation imageViewController
{
    NSInteger orientation;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    
    [self config];
    
    
}
-(void)config{
    
    if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
    {
        NSLog(@"INIT Lands");
        orientation=1;
    }else  {
        NSLog(@"INIT port");
        orientation=2;
    }
    

    self.customImageView.image = self.img;
    self.customImageView.frame = CGRectMake(self.customImageView.frame.origin.x, self.customImageView.frame.origin.y, 768, 1004);
    self.customImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self resizeToolbar];
}


-(void)orientationChanged:(NSNotification *)object{
    UIDeviceOrientation deviceOrientation = [[object object] orientation];
    
    if (deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationLandscapeRight)
    {
            NSLog(@"lands");
        orientation = 1;
    }else{

        orientation = 2;
                NSLog(@"portrait");
    }
    
    
     [self resizeToolbar];

}

-(void) resizeToolbar{

    if(orientation == 1){

        [self.toolbar setFrame:CGRectMake(self.toolbar.frame.origin.x,20,self.toolbar.frame.size.width, self.toolbar.frame.size.height)];
    }
    
    if(orientation == 2){
                [self.toolbar setFrame:CGRectMake(self.toolbar.frame.origin.x,20,self.toolbar.frame.size.width, self.toolbar.frame.size.height)];
    }

}


-(IBAction)doneView:(id)sender{
    NSLog(@"Dismiss doneView");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
