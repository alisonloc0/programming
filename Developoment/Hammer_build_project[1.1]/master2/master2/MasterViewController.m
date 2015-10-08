//
//  MasterViewController.m
//  master2
//
//  Created by user on 04/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterViewController2.h"
#import "Colors.h"
#import "estimateCustomCell.h"
#import "Estimates.h"
#import "Insurance.h"
#import "Body_shop_repaire.h"
#import "Veicle.h"
#import "Parts.h"
#import "Espec_part.h"
#import "Pictures.h"

#import "DetailViewController.h"
#import "showEstimateViewController.h"

#import "preferencesDefault.h"

@interface MasterViewController ()
{
    NSPredicate * defaultPredicate;

}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.searchEstimates.delegate = self;
    
    UIBarButtonItem * remove = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:self.editButtonItem.action];
    
    self.navigationItem.leftBarButtonItem = remove;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];

    UIBarButtonItem *listPresetButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(goToListPreset:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addButton,listPresetButton, nil];
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    self.detailViewController.managedObjectContext = self.managedObjectContext;
    self.detailViewController.fetchedResultsController = self.fetchedResultsController;
    
    
    self.navigationItem.title = @"Estimates";
    
    NSLog(@"ViewDidLoad");
    
    //[self createNewObject];

}


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"ViewWillAppear");
    if(self.fetchedResultsController != NULL && [self.searchEstimates.text isEqualToString:@""]){
    [self restoreSearchTableToDefault];

    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    NSLog(@"%@",[NSDate date]);
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];

    Estimates * estimate = (Estimates *)[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];

    
    NSEntityDescription *entityInsurance = [NSEntityDescription entityForName:@"Insurance" inManagedObjectContext:self.managedObjectContext];
    
    Insurance * insurance = (Insurance *)[NSEntityDescription insertNewObjectForEntityForName:[entityInsurance name] inManagedObjectContext:context];
    
    
    NSEntityDescription *entityBody_shop = [NSEntityDescription entityForName:@"Body_shop_repaire" inManagedObjectContext:self.managedObjectContext];
    
    Body_shop_repaire * body_shop = (Body_shop_repaire *)[NSEntityDescription insertNewObjectForEntityForName:[entityBody_shop name] inManagedObjectContext:context];
    
    NSEntityDescription * entityVeicle = [NSEntityDescription entityForName:@"Veicle" inManagedObjectContext:self.managedObjectContext];
    
    Veicle * veicle = (Veicle *) [NSEntityDescription insertNewObjectForEntityForName:[entityVeicle name] inManagedObjectContext:context];
    
    
    NSEntityDescription * entityParts = [NSEntityDescription entityForName:@"Parts" inManagedObjectContext:self.managedObjectContext];
    
    Parts * parts = (Parts *) [NSEntityDescription insertNewObjectForEntityForName:[entityParts name] inManagedObjectContext:context];
    
    NSEntityDescription * entityEspec_part = [NSEntityDescription entityForName:@"Espec_part" inManagedObjectContext:self.managedObjectContext];
    
        Espec_part * espec1 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec2 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec3 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec4 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec5 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec6 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec7 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec8 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec9 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec10 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec11 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec12 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec13 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec14 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];
    
        Espec_part * espec15 = (Espec_part *) [NSEntityDescription insertNewObjectForEntityForName:[entityEspec_part name] inManagedObjectContext:context];

    
    NSEntityDescription * entityPictures = [NSEntityDescription entityForName:@"Pictures" inManagedObjectContext:self.managedObjectContext];
    
    Pictures * pictures = (Pictures *) [NSEntityDescription insertNewObjectForEntityForName:[entityPictures name] inManagedObjectContext:context];
    
    NSDate * newDate = [NSDate date];
    NSString * protocol = [self generateNewProtocol];
    [estimate setProtocol:protocol];
    [estimate setDate_estimate:newDate];
    [estimate setLanguage:[preferencesDefault getLanguagePreference]];
    [estimate setCoin:[preferencesDefault getCoinPreference]];
    [estimate setString_date_query:[self getStringOfDate:newDate]];
    [estimate setTelDefault:@"+27 (0) 818868853"];
    [veicle setColor:@"#000000"];

    
    [estimate setVeicle:veicle];
    [estimate setInsurance:insurance];
    [estimate setBody_shop_repaire:body_shop];

    [parts setBack_left_door:espec1];
    [parts setBack_left_wing:espec2];
    [parts setBack_right_wing:espec3];
    [parts setBonnet:espec4];
    [parts setBoot:espec5];
    [parts setFront_left_door:espec6];
    [parts setFront_left_wing:espec7];
    [parts setFront_right_door:espec8];
    [parts setFront_right_wing:espec9];
    [parts setLeft_roof_pillar:espec10];
    [parts setBack_right_door:espec11];
    [parts setRight_roof_pillar:espec12];
    [parts setRoof:espec13];
    [parts setSun_roof:espec14];
    [parts setOther:espec15];
    
    [estimate setParts:parts];
    [estimate setPictures:pictures];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
    
	NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	

    
    // Name Folder images
    NSString * folder = [NSString stringWithFormat:@"/folder_%@",protocol];

    // Path Folder images
    NSString *dataPath = [docDir stringByAppendingPathComponent:folder];
	NSLog(@"New directory created: %@",dataPath);

    //Create folder images
    NSError * error_dir;
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error_dir];
    else
        NSLog(@"Directory was exists");
    

    
    
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"estimateCustomCell";
    
    estimateCustomCell *cell = (estimateCustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"estimateCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Deletando folders de imagens
        Estimates  *object = (Estimates *)[[self fetchedResultsController] objectAtIndexPath:indexPath];
        
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        // Name Folder images
        NSString * folder = [NSString stringWithFormat:@"/folder_%@",object.protocol];
        
        // Path Folder images
        NSString *dataPath = [docDir stringByAppendingPathComponent:folder];
        
        NSLog(@"DELETANDO FOLDER");
        NSLog(@"name of directory to delete %@",dataPath);
        
        //Delete folder images
        if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]){
            NSLog(@"Deletando folder : %@",dataPath);
            [[NSFileManager defaultManager] removeItemAtPath:dataPath error:nil];
        }else{
            NSLog(@"folder não existe: %@",dataPath);
        }
        
        Estimates * estimateInUse = ( Estimates * ) self.detailViewController.detailItem;
        
        NSLog(@"%@ %@",object.protocol,estimateInUse.protocol);
        
        if(object.protocol == estimateInUse.protocol){
            
            NSLog(@"Objeto em uso sendo , bloquiado tela");
            DetailViewController * detailsView = (DetailViewController *)self.detailViewController;
            [detailsView.containerView setAlpha:0.3];
            [detailsView.containerView setUserInteractionEnabled:NO];
            
        }
                    NSLog(@"Deletando..");
        
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        NSError *error = nil;

        if (![context save:&error]) {

            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);

            abort();
        }
        
        
        

    }

   
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

    return @"     X";
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(![[[self.splitViewController.viewControllers lastObject] topViewController] isKindOfClass:[DetailViewController class]]){
        [[[self.splitViewController.viewControllers lastObject] topViewController].navigationController popToRootViewControllerAnimated:YES];
    }
    Estimates  *object = (Estimates *)[[self fetchedResultsController] objectAtIndexPath:indexPath];
    self.detailViewController.detailItem = object;
}


- (void)configureCell:(estimateCustomCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
    Estimates * object = (Estimates * )[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.labelProtocol.text = [NSString stringWithFormat:@"%@",object.protocol];

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];
    NSString * date = [dateFormatter stringFromDate:object.date_estimate];

    cell.labelDate.text = [NSString stringWithFormat:@"%@",date];
    
    Body_shop_repaire * body_shop = (Body_shop_repaire *) object.body_shop_repaire;
    if(body_shop.complete_name !=NULL && (![body_shop.complete_name isEqualToString:@""]))
        cell.labelName.text = body_shop.complete_name;
            else
            cell.labelName.text = @"Oficina";
    
    
    Veicle * v = (Veicle * )object.veicle;
    
    if(v.brand!=NULL && (![v.brand isEqualToString:@""]))
    cell.labelBrand.text = v.brand;
        else
            cell.labelBrand.text = @"Marca";
    
    if(v.license_no !=NULL && (![v.license_no isEqualToString:@""]))
    cell.labelLicense.text = v.license_no;
        else
            cell.labelLicense.text = @"Placa";
    
    if(v.model !=NULL && (![v.model isEqualToString:@""]))
        cell.labelModel.text = v.model;
            else
                cell.labelModel.text = @"Modelo";

    if(v.color != NULL ){
            cell.colorView.textColor = [Colors colorFromHexString:v.color];
    }
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Estimates" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date_estimate" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    if(defaultPredicate == NULL){
        defaultPredicate =  fetchRequest.predicate;
    }
    
    [fetchRequest setPredicate:defaultPredicate];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

#pragma mark searchBar


-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    [self.searchEstimates setShowsCancelButton:YES animated:YES];
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.searchEstimates setText:@""];
    [self.searchEstimates resignFirstResponder];
    [self.searchEstimates setShowsCancelButton:NO animated:YES];
    [self restoreSearchTableToDefault];
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchEstimates resignFirstResponder];
    [self.searchEstimates setShowsCancelButton:NO animated:YES];
}



-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [self searchForText:searchText];
    if([searchText isEqualToString:@""]){
        [self restoreSearchTableToDefault];
    }
}



- (void)searchForText:(NSString *)searchText
{
    
    [NSFetchedResultsController deleteCacheWithName:@"Master"];
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"(protocol contains[cd] %@) OR (string_date_query contains[cd] %@) OR (veicle.license_no contains[cd] %@) OR (veicle.brand contains[cd] %@) OR (veicle.model contains[cd] %@)  OR (body_shop_repaire.complete_name contains[cd] %@)",searchText,searchText,searchText,searchText,searchText,searchText];

    
    [[self.fetchedResultsController fetchRequest] setPredicate:pred];
    
    NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    [self.tableView reloadData];
}


-(void) restoreSearchTableToDefault{
    
    [NSFetchedResultsController deleteCacheWithName:@"Master"];
    
    
    [[self.fetchedResultsController fetchRequest] setPredicate:defaultPredicate];
    
    NSError *error = nil;
    
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    [self.tableView reloadData];
    
}


#pragma mark Actions

- (void)goToListPreset:(id)sender{
    
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"viewPresetID";
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    MasterViewController2 * controller = (MasterViewController2 *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    controller.managedObjectContext = self.managedObjectContext;
    
    [self.navigationController pushViewController:controller animated:YES];
    

}

-(NSString *) generateNewProtocol{

    NSString * ret;

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSInteger count;
    NSString * checkCount = [prefs stringForKey:@"protocolNumber"];

    if(checkCount == NULL){
        count = 1;
        NSLog(@"FIRST PROTOCOL :  >>>>%ld",(long)count);
        [prefs setInteger:count forKey:@"protocolNumber"];
        
    }else{
    
        count = [prefs integerForKey:@"protocolNumber"];
        count++;
        NSLog(@"NEW PROTOCOL :  >>>>%ld",(long)count);
        [prefs setInteger:count forKey:@"protocolNumber"];
    }

    return ret = [NSString stringWithFormat:@"%ld",(long)count];

}

-(NSString *) getStringOfDate:(NSDate *)date{

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];
    NSString * s_date = [dateFormatter stringFromDate:date];
    NSLog(@"%@",s_date);
    return s_date;
}



@end
