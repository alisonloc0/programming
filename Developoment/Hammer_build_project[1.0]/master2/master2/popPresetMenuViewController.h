//
//  popPresetMenuViewController.h
//  master2
//
//  Created by user on 03/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "actionPresetProtocol.h"

@interface popPresetMenuViewController : UITableViewController

@property(nonatomic,retain) id<actionPresetProtocol> delegate;

@end
