//
//  aViewController.m
//  salversom
//
//  Created by user on 02/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "aViewController.h"

@interface aViewController ()

@end

@implementation aViewController

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
    // Do any additional setup after loading the view from its nib.
    self.scroll.contentSize = CGSizeMake(2000, 2000);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
