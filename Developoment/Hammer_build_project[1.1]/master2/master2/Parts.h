//
//  Parts.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Espec_part;

@interface Parts : NSManagedObject

@property (nonatomic, retain) NSString * dis_reassembly;
@property (nonatomic, retain) NSString * total;
@property (nonatomic, retain) Espec_part *back_left_door;
@property (nonatomic, retain) Espec_part *back_left_wing;
@property (nonatomic, retain) Espec_part *back_right_door;
@property (nonatomic, retain) Espec_part *back_right_wing;
@property (nonatomic, retain) Espec_part *bonnet;
@property (nonatomic, retain) Espec_part *boot;
@property (nonatomic, retain) Espec_part *front_left_door;
@property (nonatomic, retain) Espec_part *front_left_wing;
@property (nonatomic, retain) Espec_part *front_right_door;
@property (nonatomic, retain) Espec_part *front_right_wing;
@property (nonatomic, retain) Espec_part *other;
@property (nonatomic, retain) Espec_part *right_roof_pillar;
@property (nonatomic, retain) Espec_part *roof;
@property (nonatomic, retain) Espec_part *sun_roof;
@property (nonatomic, retain) Espec_part *left_roof_pillar;

@end
