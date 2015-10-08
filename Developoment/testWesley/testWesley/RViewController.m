//
//  RViewController.m
//  testWesley
//
//  Created by user on 01/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "RViewController.h"
#import "detailsViewController.h"


@interface RViewController ()

@end

@implementation RViewController
@synthesize viewBack;


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
    struct CGColor * borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    float borderWidth  = 1.0f;
    
    [super viewDidLoad];
    
    self.viewBack.layer.borderColor = borderColor;
    self.viewBack.layer.borderWidth = borderWidth;
    
    
    
    self.scroll.contentSize = CGSizeMake(200, 2200);

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 130, self.viewBack.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.viewBack addSubview:lineView];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, self.viewBack.bounds.size.width, 1)];
    lineView2.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
   [self.viewBack addSubview:lineView2];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 650, self.viewBack.bounds.size.width, 1)];
    lineView3.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.viewBack addSubview:lineView3];

    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 900, self.viewBack.bounds.size.width, 1)];
    lineView4.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.viewBack addSubview:lineView4];
    
    UIView *lineView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 980, self.viewBack.bounds.size.width, 1)];
    lineView5.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.viewBack addSubview:lineView5];
    
    MFMailComposeViewController* c = [[MFMailComposeViewController alloc] init];
    c.mailComposeDelegate = self;
    [c setSubject:@"My Subject"];
    [c setMessageBody:@"Hello there." isHTML:NO];
    [self presentViewController:c animated:YES completion:nil];

    
    
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actionGenerate{

    detailsViewController * controller = [[detailsViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
    
}

@end
