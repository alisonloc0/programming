//
//  formPriceViewController.m
//  master2
//
//  Created by user on 01/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "formPriceViewController.h"
#import "cellDescriptController.h"
#import "DescriptPrices.h"
#import "AppDelegate.h"
#import "Prices.h"
#import "PDFControl.h"

@interface formPriceViewController ()
{
    
    int xPortrait;
    int xLands;
    NSMutableArray * arrayPresetDescript;
    int editing;
}

@end
// TAGS
// 5 - 9 UITextField

@implementation formPriceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure TextFields
    
    for(NSInteger i = 5; i<=9;i++){
        UITextField * textField = (UITextField *)[self.view viewWithTag:i];
        textField.delegate = self;
    }

        [self configureView];
        [self configureTable];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        NSLog(@"NEW ITEM RECEIVE FORM");

        [self cleanLayout];
        [self configureName];
        [self changeDataOfTable];
        
        [self.containerView setAlpha :1];
        [self.containerView setUserInteractionEnabled:YES];
        [self generetePdf];


    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

-(void)configureName{
    
    Prices * price = (Prices *) self.detailItem;
    if(price.name != NULL && (![price.name isEqualToString:@"New Preset"]))
        self.textNome.text = price.name;

}
-(void) cleanLayout{
    NSLog(@"Limpando tela");
    for(NSInteger i = 5; i<=9;i++){
        UITextField * textField = (UITextField *)[self.view viewWithTag:i];
        textField.text = @"";
    }

}
-(void)configureTable{
    
    self.presetTable.delegate = self;
    self.presetTable.dataSource = self;

    editing = 0;
}

-(void)configureView{
    
    [self.containerView setAlpha:0.3];
    [self.containerView setUserInteractionEnabled:NO];
    
    UIBarButtonItem * remove = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(editionMode:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:remove,nil];
    
    xPortrait = 30;
    xLands = 30;
    
    if (UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        
        self.containerView.frame = CGRectMake(xPortrait,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
        
    }else{
        self.containerView.frame = CGRectMake(xLands,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
    }
    
    
    self.scrollView.contentSize = CGSizeMake(0, 1000);
    
    struct CGColor * borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    float borderWidth  = 1.0f;
    
    self.backgroundView.layer.borderColor = borderColor;
    self.backgroundView.layer.borderWidth = borderWidth;
    
    
    
    if (self.detailItem) {
        NSLog(@"ITEM SELECIONADO");
        
        
        [self.containerView setAlpha:1];
        [self.containerView setUserInteractionEnabled:YES];
        
        
    }else{
        [self.containerView setAlpha:0.3];
        [self.containerView setUserInteractionEnabled:NO];
        NSLog(@"NENHUM ITEM SELECIONADO");
        
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
    
    static NSString *simpleTableIdentifier = @"cellDescript";
    
    cellDescriptController *cell = (cellDescriptController *)[self.presetTable dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"cellViewController" owner:self options:nil];
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
        
        
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}


- (void)configureCell:(cellDescriptController *)cell atIndexPath:(NSIndexPath *)indexPath{
    
    DescriptPrices * object = (DescriptPrices * )[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.labelType.text = [NSString stringWithFormat:@"%@",object.tipo];
    cell.labelDe.text = [NSString stringWithFormat:@"%@",object.de];
    cell.labelAte.text = [NSString stringWithFormat:@"%@",object.ate];

    NSString * categoria = [NSString stringWithFormat:@"%@",object.categoria];
    
    if([categoria isEqualToString:@"0"])
        categoria = @"Horizontal";
    else
        categoria = @"Vertical";
    
    cell.labelCategoria.text = categoria;
    double value = [object.valor doubleValue];
    cell.labelValor.text = [NSString stringWithFormat:@"%0.2f",value];

    
    
}



#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DescriptPrices" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];

    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"de" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    Prices * prices = (Prices *) self.detailItem;
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"desc_id_prices = %@",prices.id_price];
    
    [fetchRequest setPredicate:pred];
    
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
    [self.presetTable beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
   
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.presetTable insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.presetTable deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.presetTable;

    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(cellDescriptController *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }

}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.presetTable endUpdates];
    // Generete a new PDF of table prices
    [self generetePdf];
}


-(void)generetePdf{
    
    [self createDirectoryPrices];

    Prices * prices = (Prices *)self.detailItem;
    NSString * fileName = [NSString stringWithFormat:@"preset/preset_%@.pdf",prices.id_price];
    NSString * path = [PDFControl createPDFfromUIView:self.tablePDF saveToDocumentsWithFileName:fileName];
    NSLog(@"%@",path);
    
}


-(void)createDirectoryPrices{
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    // Name Folder images
    NSString * folder = [NSString stringWithFormat:@"/preset"];
    
    // Path Folder images
    NSString *dataPath = [docDir stringByAppendingPathComponent:folder];
	NSLog(@"New directory created: %@",dataPath);
    
    //Create folder images
    NSError * error_dir;
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error_dir];
    else
        NSLog(@"Directory prices was exists");
}

- (IBAction)insertNewObject:(id)sender
{
    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    
    DescriptPrices *newManagedObject = (DescriptPrices *)[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    Boolean validaForm = [self validaForm];
    if(validaForm == true){
        
        NSLog(@"form validado");
        Prices * price = (Prices *)self.detailItem;
        int tipo = [self.textTipo.text intValue];
        int de = [self.textDe.text intValue];
        int ate = [self.textAte.text intValue];
        double valor = [self.textValor.text doubleValue];
        int categoria = self.segmentCategoria.selectedSegmentIndex;
        
        [newManagedObject setTipo:[NSNumber numberWithInt:tipo]];
        [newManagedObject setDe:[NSNumber numberWithInt:de]];
        [newManagedObject setAte:[NSNumber numberWithInt:ate]];
        [newManagedObject setValor:[NSNumber numberWithDouble:valor]];
        [newManagedObject setCategoria:[NSNumber numberWithInt:categoria]];
        [newManagedObject setDesc_id_prices:price.id_price];
        NSLog(@"Criando novos valores para o preset de id = %@",price.id_price);
    }

    else
        NSLog(@"form não validado");
    
    
    
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
}

-(Boolean) validaForm{
    Boolean validaForm = true;
    
    if(self.textTipo.text == NULL || [self.textTipo.text isEqualToString:@""])
        validaForm =  false;
    if(self.textDe.text == NULL || [self.textDe.text isEqualToString:@""])
        validaForm =  false;
    if(self.textAte.text == NULL || [self.textAte.text isEqualToString:@""])
        validaForm =  false;
    if(self.textValor.text == NULL || [self.textValor.text isEqualToString:@""])
        validaForm =  false;

    if(validaForm == false){

        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Aviso"
                                                          message:@"Preencha corretamente"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    
    
    return validaForm;
}

-(void)editionMode :(id)sender
{
    if(editing == 0){
        [self.presetTable setEditing:YES animated:YES];
        editing = 1;
    }else
    if(editing == 1){
        [self.presetTable setEditing:NO animated:YES];
        editing = 0;
    }
    

}

-(void)changeDataOfTable{
    
    [NSFetchedResultsController deleteCacheWithName:@"Master2"];
    NSLog(@"nova consulta");
    [NSFetchedResultsController deleteCacheWithName:@"Master"];

    Prices * prices = (Prices *) self.detailItem;
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"desc_id_prices = %@",prices.id_price];
    
    [[self.fetchedResultsController fetchRequest] setPredicate:pred];
    
    NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    [self.presetTable reloadData];

}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


//UPDATE
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"oi");
    NSInteger tag = textField.tag;
    if(tag == 5)
        [self updateName];

}

-(void)updateName{

    if(self.textNome.text != NULL && (![self.textNome.text isEqualToString:@""]))
    {
        NSLog(@"Atualizando nome");
        Prices * price = (Prices *)self.detailItem;
        price.name = self.textNome.text;
        [self save];
    }
    
}


-(void)save{
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error to save");
    }
    
}


@end
