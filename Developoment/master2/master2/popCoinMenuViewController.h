//
//  popCoinMenuViewController.h
//  master2
//
//  Created by user on 15/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "actionCoinProtocol.h"
@interface popCoinMenuViewController : UITableViewController

@property(nonatomic,retain) id<actionCoinProtocol> delegate;

@end
