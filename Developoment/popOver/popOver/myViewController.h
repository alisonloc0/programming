//
//  myViewController.h
//  popOver
//
//  Created by user on 25/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "popOverPicture.h"

@interface myViewController : UIViewController

@property(nonatomic,retain)id<popOverPicture> delegate;

@end
