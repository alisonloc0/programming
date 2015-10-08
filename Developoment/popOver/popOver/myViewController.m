//
//  myViewController.m
//  popOver
//
//  Created by user on 25/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "myViewController.h"

@interface myViewController ()

@end

@implementation myViewController

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
    [self.delegate actionTapPicture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
