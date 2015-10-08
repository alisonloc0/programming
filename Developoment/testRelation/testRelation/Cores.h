//
//  Cores.h
//  testRelation
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Carro;

@interface Cores : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * id_;
@property (nonatomic, retain) Carro * cor_carro;

@end
