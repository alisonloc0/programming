//
//  Estimates.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Insurance, Parts, Pictures, Veicle,Body_shop_repaire,Prices;

@interface Estimates : NSManagedObject

@property (nonatomic, retain) NSString * protocol;
@property (nonatomic, retain) NSDate * date_estimate;
@property (nonatomic, retain) NSDate * date_init_work;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * coin;
@property (nonatomic, retain) NSString * repaired_for;
@property (nonatomic, retain) Insurance *insurance;
@property (nonatomic, retain) Body_shop_repaire * body_shop_repaire;
@property (nonatomic, retain) Veicle *veicle;
@property (nonatomic, retain) Parts *parts;
@property (nonatomic, retain) Pictures *pictures;
@property (nonatomic, retain) NSString * string_date_query;
@property (nonatomic, retain) NSString * lastPreset;
@property (nonatomic, retain) NSString * telDefault;

@end
