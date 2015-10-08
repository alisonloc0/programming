//
//  MasterViewController.h
//  master2
//
//  Created by user on 04/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class formPriceViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController2 : UITableViewController <NSFetchedResultsControllerDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property (strong, nonatomic) formPriceViewController *formViewController;


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UISearchBar *searchPresets;


@end
