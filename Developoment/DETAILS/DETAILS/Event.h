//
//  Event.h
//  DETAILS
//
//  Created by user on 22/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSData * color;
@property (nonatomic, retain) id color_;

@end
