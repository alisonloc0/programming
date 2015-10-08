//
//  coinControl.h
//  master2
//
//  Created by user on 15/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface coinControl : NSObject

+(NSMutableArray *) getArrayLabelCoin;
+(NSString *) getLabelValueCoin:(NSString *)type;

+(NSMutableArray *) getArrayCoin;
+(NSString *) getValueCoin:(NSString *)type;

@end
