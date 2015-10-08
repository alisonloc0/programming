//
//  actionPresetProtocol.h
//  master2
//
//  Created by user on 03/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Prices.h"

@protocol actionPresetProtocol <NSObject>
@required
-(void)putPreset:(Prices *)preset;

@end
