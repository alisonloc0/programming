//
//  Event.h
//  testeMultiples
//
//  Created by user on 03/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Carros;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) Carros *meus_carros;

@end
