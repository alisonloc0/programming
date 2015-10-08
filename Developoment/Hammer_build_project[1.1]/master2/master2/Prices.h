//
//  Prices.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Prices : NSManagedObject

@property (nonatomic, retain) NSNumber * id_price;
@property (nonatomic, retain) NSString * name;

@end
