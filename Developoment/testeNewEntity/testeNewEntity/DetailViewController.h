//
//  DetailViewController.h
//  testeNewEntity
//
//  Created by user on 06/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property ( strong , nonatomic) Event * objeto;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
