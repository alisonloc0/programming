//
//  MasterViewController.m
//  master2
//
//  Created by user on 04/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "MasterViewController2.h"

#import "DetailViewController.h"
#import "priceCustomCell.h"
#import "Prices.h"
#import "formPriceViewController.h"
#import "DescriptPrices.h"
@interface MasterViewController2 (){

    NSPredicate * defaultPredicate;
    
}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController2

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchPresets.delegate = self;
    
    UIBarButtonItem * remove = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:self.editButtonItem.action];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addButton,remove, nil];
    
    
    self.navigationItem.title = @"Prices";
    
}


-(void)viewWillAppear:(BOOL)animated{
    [self restoreSearchTableToDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];

    Prices *newManagedObject = (Prices *)[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    [newManagedObject setName:@"New Preset"];
    int newID = [[self generateNewID] intValue];
    [newManagedObject setId_price:[NSNumber numberWithInt:newID]];

    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"priceCustomCell";
    
    priceCustomCell *cell = (priceCustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"priceCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deletePrice:indexPath];
    }
}

-(void)deletePrice:(NSIndexPath *)indexPath{

    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    Prices  * object = (Prices *)[[self fetchedResultsController] objectAtIndexPath:indexPath];
    Prices * priceInUse = ( Prices * ) self.formViewController.detailItem;

    // Deletando pdf do preset
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    // Name Folder images
    NSString * folder = [NSString stringWithFormat:@"preset/preset_%@.pdf",object.id_price];
    
    // Path Folder images
    NSString *dataPath = [docDir stringByAppendingPathComponent:folder];
    
    NSLog(@"DELETANDO preset");
    NSLog(@"name of file to delete PDF preset %@",dataPath);
    
    //Delete file preset
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]){
        NSLog(@"Deletando preset : %@",dataPath);
        [[NSFileManager defaultManager] removeItemAtPath:dataPath error:nil];
    }else{
        NSLog(@"preset não existe: %@",dataPath);
    }

    
    // Veriicando se o mesmo esta na view de detalhes para bloquiada-la caso seja deletado
    NSLog(@"%@ %@",object.id_price,priceInUse.id_price);
    if(object.id_price == priceInUse.id_price){
        
        NSLog(@"Objeto em uso sendo , bloquiado tela");
        formPriceViewController * detailsView = (formPriceViewController *)self.formViewController;
        [detailsView.containerView setAlpha:0.3];
        [detailsView.containerView setUserInteractionEnabled:NO];
        
    }
    
    //Deletando todos os objetos aos quais tem o id do price
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"DescriptPrices" inManagedObjectContext:context];
    
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"desc_id_prices = %@",object.id_price];
    
    [request setPredicate:pred];
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"de" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError * error;
    NSMutableArray * array = [[context executeFetchRequest:request error:&error]mutableCopy];
    
    if(!array)
    {
        NSLog(@"Error %@",error);
    }
    NSLog(@"Objetos DescriptPrice sendo deletados.. %lu",(unsigned long)[array count]);
    
    for (DescriptPrices * Entity in array) {
        [context deleteObject:Entity];
    }
    
        NSLog(@"Objetos price sendo deletado");
    // Deletando o objeto price
    [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
    
    NSError *error_ = nil;
    if (![context save:&error_]) {
        
        NSLog(@"Unresolved error %@, %@", error_, [error_ userInfo]);
        abort();
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        Prices * price = (Prices *)[[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    if(![[[self.splitViewController.viewControllers lastObject] topViewController] isKindOfClass:[formPriceViewController class]]){

        formPriceViewController * form = [[formPriceViewController alloc]init];
        form.detailItem = price;
        //form.navigationItem.hidesBackButton = YES;
        self.formViewController = form;
        
        
        [[[self.splitViewController.viewControllers lastObject] topViewController].navigationController pushViewController:form animated:YES];
    }else{
        
        self.formViewController.detailItem = price;
    }
    
    
 //   NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
  //  self.detailViewController.detailItem = object;
}

- (void)configureCell:(priceCustomCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
    Prices * object = (Prices * )[self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.presetName.text = object.name;
    
}



#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Prices" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    if(defaultPredicate == NULL){
            defaultPredicate =  fetchRequest.predicate;
    }
    
    [fetchRequest setPredicate:defaultPredicate];
    [fetchRequest setSortDescriptors:sortDescriptors];

    
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master2"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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

    [self.searchPresets setShowsCancelButton:YES animated:YES];
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.searchPresets setText:@""];
    [self.searchPresets resignFirstResponder];
    [self.searchPresets setShowsCancelButton:NO animated:YES];
    [self restoreSearchTableToDefault];
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
        [self.searchPresets resignFirstResponder];
        [self.searchPresets setShowsCancelButton:NO animated:YES];
}



-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    [self searchForText:searchText];
    if([searchText isEqualToString:@""]){
        [self restoreSearchTableToDefault];
    }
}



- (void)searchForText:(NSString *)searchText
{

    [NSFetchedResultsController deleteCacheWithName:@"Master2"];
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"(name contains[cd] %@)",searchText,searchText];
    
    [[self.fetchedResultsController fetchRequest] setPredicate:pred];
    
    NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    [self.tableView reloadData];
}


-(void) restoreSearchTableToDefault{
    
    [NSFetchedResultsController deleteCacheWithName:@"Master2"];
    
    
    [[self.fetchedResultsController fetchRequest] setPredicate:defaultPredicate];
    
    NSError *error = nil;
    
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    [self.tableView reloadData];
    
}



-(NSString *) generateNewID{
    
    NSString * ret;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSInteger count;
    NSString * checkCount = [prefs stringForKey:@"idPresetNumber"];
    
    if(checkCount == NULL){
        count = 1;
        NSLog(@"FIRST ID PRESET NUMBER :  >>>>%ld",(long)count);
        [prefs setInteger:count forKey:@"idPresetNumber"];
        
    }else{
        
        count = [prefs integerForKey:@"idPresetNumber"];
        count++;
        NSLog(@"NEW ID PRESET NUMBER  :  >>>>%ld",(long)count);
        [prefs setInteger:count forKey:@"idPresetNumber"];
    }
    
    return ret = [NSString stringWithFormat:@"%ld",(long)count];
    
}
@end
