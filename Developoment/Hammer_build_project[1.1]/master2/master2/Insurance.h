//
//  Insurance.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Insurance : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * contract_no;
@property (nonatomic, retain) NSString * agency;
@property (nonatomic, retain) NSString * tel;
@property (nonatomic, retain) NSString * insured_for_climate_damage;


@end
