//
//  MainContentViewController.h
//  date
//
//  Created by user on 12/10/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MainContentViewController : UIViewController<UIPageViewControllerDataSource>{


    float yoff;
    float xoff;
    float yvel;
}

@property (strong, nonatomic) CMMotionManager *motionManager;
@property   (weak,nonatomic)  IBOutlet UIScrollView * scrollView;

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) IBOutlet UIImageView * backImageView;
@property (strong, nonatomic) IBOutlet UIImageView * middleImageView;
@property (strong, nonatomic) IBOutlet UIImageView * frontImageView;

@property (strong, nonatomic) IBOutlet UIButton * btLeft;
@property (strong, nonatomic) IBOutlet UIButton * btRight;

@end
