//
//  Espec_part.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Espec_part : NSManagedObject

@property (nonatomic, retain) NSString * type_of_damage;
@property (nonatomic, retain) NSString * count;
@property (nonatomic, retain) NSString * price_tax_exempt;
@property (nonatomic, retain) NSNumber * paint;

@end
