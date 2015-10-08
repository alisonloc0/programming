//
//  myViewController.m
//  lala
//
//  Created by user on 02/01/14.
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
    
    self.scroll.contentSize = CGSizeMake(320, 2400.0);
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//
//    [scrollView setContentSize:CGSizeMake(320, 1100)];
//    [scrollView setScrollEnabled:YES];
//    
//    [self.view addSubview:scrollView];
//    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 320, 300)];
//    [view1 setBackgroundColor:[UIColor redColor]];
//    [scrollView addSubview:view1];
//    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 320, 300)];
//    [view2 setBackgroundColor:[UIColor blueColor]];
//    [scrollView addSubview:view2];
//    
//    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 750, 320, 300)];
//    [view3 setBackgroundColor:[UIColor yellowColor]];
//    [scrollView addSubview:view3];
//    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
