//
//  imageViewController.h
//  master2
//
//  Created by user on 27/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *customImageView;

@property (strong,nonatomic) UIImage * img;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end
