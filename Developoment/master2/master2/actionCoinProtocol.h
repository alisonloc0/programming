//
//  actionCoinProtocol.h
//  master2
//
//  Created by user on 15/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol actionCoinProtocol <NSObject>

@required
-(void)coinChangeView:(NSString *)type withName:(NSString *)nameCoin;

@end
