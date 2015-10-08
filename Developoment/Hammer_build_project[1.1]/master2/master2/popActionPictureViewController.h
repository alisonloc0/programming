//
//  popActionPictureViewController.h
//  master2
//
//  Created by user on 25/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "actionPictureProtocol.h"

@interface popActionPictureViewController : UIViewController

@property(nonatomic,retain) id<actionPictureProtocol> delegate;

@end
