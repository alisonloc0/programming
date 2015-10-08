//
//  Recommend.h
//  master2
//
//  Created by user on 08/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Recommend : NSManagedObject

@property (nonatomic, retain) NSString * adress;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * complete_name;
@property (nonatomic, retain) NSString * postal_code;
@property (nonatomic, retain) NSString * tel;

@end
