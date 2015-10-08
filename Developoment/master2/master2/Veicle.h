//
//  Veicle.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Veicle : NSManagedObject

@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * license_no;
@property (nonatomic, retain) NSString * car_frame_no;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSString * km_counter;

@end
