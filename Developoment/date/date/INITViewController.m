//
//  INITViewController.m
//  date
//
//  Created by user on 10/10/13.
//  Copyright (c) 2013 User. All rights reserved.
//

// PARALAX EFFECT ON IMAGE
// BASE PAGE BASED APPLICATION

#import "INITViewController.h"

@interface INITViewController ()

@end

@implementation INITViewController

@synthesize delegate,pathImage,indexImage;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;
@synthesize label6;
@synthesize label7;
@synthesize label8;
@synthesize label9;

@synthesize NSlabel1;
@synthesize NSlabel2;
@synthesize NSlabel3;
@synthesize NSlabel4;
@synthesize NSlabel5;
@synthesize NSlabel6;
@synthesize NSlabel7;
@synthesize NSlabel8;
@synthesize NSlabel9;


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

        self.label2.adjustsFontSizeToFitWidth = YES;
        self.label3.adjustsFontSizeToFitWidth = YES;
        self.label6.adjustsFontSizeToFitWidth = YES;
    
    
        self.label1.text = NSlabel1;
        self.label2.text = NSlabel2;
        self.label3.text = NSlabel3;
        self.label4.text = NSlabel4;
        self.label5.text = NSlabel5;
    
        self.label6.text = NSlabel6;
        self.label7.text = NSlabel7;
        self.label8.text = NSlabel8;
        self.label9.text = NSlabel9;
    

 
}



-(void)viewWillAppear:(BOOL)animated{
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    
    [self.delegate transitionBackgroundImage:self.indexImage];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
