//
//  DescriptPrices.h
//  master2
//
//  Created by user on 03/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DescriptPrices : NSManagedObject

@property (nonatomic, retain) NSNumber * ate;
@property (nonatomic, retain) NSNumber * categoria;
@property (nonatomic, retain) NSNumber * de;
@property (nonatomic, retain) NSNumber * tipo;
@property (nonatomic, retain) NSNumber * valor;
@property (nonatomic, retain) NSNumber * desc_id_prices;

@end
