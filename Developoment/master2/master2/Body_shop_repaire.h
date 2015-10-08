//
//  Body_shop_repaire.h
//  master2
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Body_shop_repaire : NSManagedObject

@property (nonatomic, retain) NSString * adress;
@property (nonatomic, retain) NSString * postal_code;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * tel;
@property (nonatomic, retain) NSString * complete_name;

@end
