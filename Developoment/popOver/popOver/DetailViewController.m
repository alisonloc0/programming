//
//  DetailViewController.m
//  popOver
//
//  Created by user on 25/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "DetailViewController.h"
#import "myViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

-(IBAction)popOpen:(id)sender{

    myViewController *viewController = [[myViewController alloc] initWithNibName:@"myViewController" bundle:nil];
    
    viewController.delegate = self;

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
        self.poc = [[UIPopoverController alloc] initWithContentViewController:navigationController];
    
         self.poc.popoverContentSize = CGSizeMake(300, 300);
    [    self.poc presentPopoverFromRect:self.buttonPop.frame inView:self.view permittedArrowDirections: UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionUp animated:YES];
    
}

-(void)actionTapPicture{

    NSLog(@"oi");

}

@end
