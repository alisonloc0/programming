//
//  DetailViewController.h
//  popOver
//
//  Created by user on 25/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "popOverPicture.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate,popOverPicture>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIButton *buttonPop;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, retain) IBOutlet UIPopoverController *poc;

@end
