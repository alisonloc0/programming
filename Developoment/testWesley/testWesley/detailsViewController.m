//
//  detailsViewController.m
//  testWesley
//
//  Created by user on 04/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "detailsViewController.h"

@interface detailsViewController ()

@end

@implementation detailsViewController

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
    UIBarButtonItem * pdfButton = [[UIBarButtonItem alloc] initWithTitle:@"PDF" style:UIBarButtonItemStylePlain target:self action:@selector(actionPdf:)];
    
    
    UIBarButtonItem * emailButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(actionEmail:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:pdfButton,emailButton, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
