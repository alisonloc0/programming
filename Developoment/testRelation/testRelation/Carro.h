//
//  Carro.h
//  testRelation
//
//  Created by user on 20/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cores;

@interface Carro : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * cor_carro;
@property (nonatomic, retain) Cores *r_cor;

@end
