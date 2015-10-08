//
//  popActionPictureViewController.m
//  master2
//
//  Created by user on 25/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "popActionPictureViewController.h"

@interface popActionPictureViewController ()

@end

@implementation popActionPictureViewController

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
    for(NSInteger i = 1; i<=4;i++){
        UIButton * button = (UIButton *)[self.view viewWithTag:i];
        [button addTarget:self action:@selector(optionTap:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)optionTap:(id)sender{

    UIButton * button = (UIButton *) sender;
    NSLog(@"%ld",(long)button.tag);
    NSInteger tag = button.tag;
    [self.delegate actionTapPicture:tag];

    
}

@end
