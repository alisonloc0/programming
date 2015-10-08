//
//  preferencesDefault.h
//  master2
//
//  Created by user on 15/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface preferencesDefault : NSObject

+(NSString *) getLanguagePreference;
+(NSString *) getCoinPreference;
+(void) setLanguagePreference:(NSInteger)index;
+(void) setCoinPreference:(NSInteger)index;
@end
